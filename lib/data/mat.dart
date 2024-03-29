import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class Mat {
  static Future<List<String>> getFirstElements() async {
    String fileContent = await rootBundle.loadString('assets/bdd/notes2.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(fileContent);
    List<String> firstElements = [];

    for (List<dynamic> row in csvTable) {
      if (row.isNotEmpty) {
        firstElements.add(row.first.toString().trim());
      }
    }

    return firstElements;
  }


  static Future<List<List<String>>> getNotes() async {
    String fileContent = await rootBundle.loadString('assets/bdd/notes2.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(fileContent);
    List<List<String>> notes = [];

    for (List<dynamic> row in csvTable) {
      List<String> formattedRow = row.map((cell) => cell.toString().trim()).toList();
      notes.add(formattedRow);
    }

    return notes;
  }


  Future<List<double>> AfficherMoyennes() async {
    List<double> averages = [];
    List<List<dynamic>> data = [];
    final mydata = await rootBundle.loadString("assets/bdd/notes2_moy.csv");
    List<List<dynamic>> csvTableau = CsvToListConverter().convert(mydata);
    data = csvTableau;
    // Parcourir chaque ligne du tableau CSV
    for (List<dynamic> row in csvTableau) {

      // Vérifier si la ligne n'est pas vide et si elle a au moins une colonne
      if (row.isNotEmpty) {
        // Récupérer la dernière valeur de la ligne (dernière colonne)
        dynamic lastValue = row.last;

        // Convertir la dernière valeur en double et l'ajouter à la liste des moyennes
        double average = double.tryParse(lastValue.toString().replaceAll(',', '.')) ?? 0.0;
        averages.add(average);
      }
    }

    return averages; // Ajout de cette ligne pour retourner la liste des moyennes
  }





}