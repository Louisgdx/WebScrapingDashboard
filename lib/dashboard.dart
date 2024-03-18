import 'package:dashboard_bouarour_fodouop_gaudeaux/widget_moyenne_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'notes.dart';
import 'marge_gauche.dart';
import 'entete.dart';
import 'widget_calendrier.dart';
import 'widget_edt.dart';
import 'widget_matieres.dart';
import 'widget_autre.dart' ;


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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
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
          ),
          MargeGauche(
            child: SizedBox(),
          ),
          Entete(),
          WidgetMoyenneGen(),
          WidgetCalendrier(),
          WidgetEdt(),
          WidgetMatieres(),
          WidgetAutre(),
          Positioned(
            top: 0,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return NotesDialog(csvData: csvData);
                  },
                );
              },
              tooltip: 'Afficher les notes',
              child: Icon(Icons.notes),
            ),
          ),
        ],
      ),
    );
  }
}
