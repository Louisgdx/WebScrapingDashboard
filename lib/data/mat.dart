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


  static Future<List<double>> calculateAverages(List<List<String>> notes) async {
    List<double> averages = [];

    for (List<String> row in notes) {
      double somme = 0.0;
      int count = 0;

      for (String note in row) {
        double parsedValue = double.tryParse(note.trim()) ?? 0.0;
        somme += parsedValue;
        count++;
      }

      double average = count > 0 ? somme / count : 0.0;
      averages.add(average);
    }

    return averages;
  }





}





