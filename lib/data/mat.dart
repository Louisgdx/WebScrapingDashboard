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


  static List<double> calculateAverages(List<List<String>> notes) {
    List<double> averages = [];

    for (List<String> noteRow in notes) {
      print('Note Row: $noteRow');
      if (noteRow.isNotEmpty) {
        List<double> numericNotes = noteRow.map((note) => double.tryParse(note) ?? 0.0).toList();
        print('Numeric Notes: $numericNotes');
        double average = numericNotes.isNotEmpty ? numericNotes.reduce((a, b) => a + b) / numericNotes.length : 0.0;
        print('Average: $average');
        averages.add(average);
      } else {
        averages.add(0.0);
      }
    }

    return averages;
  }

}



