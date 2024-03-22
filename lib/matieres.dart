import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'colors.dart';
import '/data/mat.dart';

class Matieres extends StatefulWidget {
  @override
  _MatieresState createState() => _MatieresState();
}

class _MatieresState extends State<Matieres> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  late List<String> _matieres;
  late List<double> _averages;
  late List<List<String>> _notes;

  @override
  void initState() {
    super.initState();
    print("Initializing state...");
    _loadData();
  }

  Future<void> _loadData() async {
    _matieres = await Mat.getFirstElements();
    _notes = await Mat.getNotes();
    _averages = Mat.calculateAverages(_notes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors().grisFonce.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: AppColors().grisFonce),
              decoration: InputDecoration(
                hintText: 'Rechercher une matière',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade300, size: 24),
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemCount: _matieres.length,
              itemBuilder: (context, index) {
                String matiere = _matieres[index].split(';')[0];
                double average = _averages[index];
                List<String> notes = _notes[index];

                if (!matiere.toLowerCase().contains(_searchText.toLowerCase())) {
                  return Container(); // Empty container if the search doesn't match
                }

                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        matiere,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Moyenne: ${average.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _showNotesDialog(notes, matiere);
                        },
                        child: Text('Accéder aux notes'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: Text('Retour'),
        icon: Icon(Icons.arrow_back),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<void> _showNotesDialog(List<String> notes, String matiere) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Résultats($matiere)'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: notes.map((note) {
                List<String> noteElements = note.split(';');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 1; i < noteElements.length; i++)
                      Text('Note ${i.toString()}: ${noteElements[i]}/20 '),
                  ],
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
