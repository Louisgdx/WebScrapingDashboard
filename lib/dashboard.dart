import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'notes.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<List<dynamic>> csvData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCSVData();
  }

  void loadCSVData() async {
    try {
      final rawData = await rootBundle.loadString('assets/bdd/notes.csv');
      List<List<dynamic>> data = CsvToListConverter(eol: ';').convert(rawData);
      setState(() {
        csvData = data;
        isLoading = false;
      });
    } catch (e) {
      print('Erreur lors du chargement du fichier CSV: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Action à exécuter lorsque le bouton est pressé
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade300,
              Colors.indigo.shade200,
              Colors.yellow.shade100
            ],
          ),
        ),
        // L'affichage du fichier CSV est retiré d'ici
      ),
      floatingActionButton: Tooltip(
        message: 'Afficher les notes',
        child: FloatingActionButton(
          onPressed: () {
            // Afficher les notes lorsque le bouton flottant est pressé
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return NotesDialog(csvData: csvData);
              },
            );
          },
          child: Icon(Icons.notes),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

