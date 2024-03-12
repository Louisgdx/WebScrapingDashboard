import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

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
    loadCSVData(); // Appel de la méthode pour charger les données CSV au démarrage
  }

  // Méthode pour charger les données CSV à partir du fichier
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xCC8B4513), Color(0x46250D)], // Marron foncé à partir de #8B4513
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : csvData.isNotEmpty && csvData.length > 1
              ? DataTable(
            columns: csvData[0].map((item) => DataColumn(
              label: Text(
                item.toString(),
              ),
            )).toList(),
            rows: csvData.sublist(1).map((csvrow) => DataRow(
              cells: csvrow.map((csvItem) => DataCell(
                Text(
                  csvItem.toString(),
                ),
              )).toList(),
            )).toList(),
          )
              : Center(
            child: Text('Aucune donnée à afficher'),
          ),
        ),
      ),
    );
  }
}
