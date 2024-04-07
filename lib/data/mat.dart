import 'dart:convert';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:core';


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
      List<String> formattedRow = row.map((cell) => cell.toString().trim())
          .toList();
      notes.add(formattedRow);
    }

    return notes;
  }







// afficher les moy pour chaque matiere

  Future<List<String>> AfficherMoyennes() async {
    List<String> averages = [];
    final String data = await rootBundle.loadString("assets/bdd/notes2.csv");
    List<List<dynamic>> csvTableau = CsvToListConverter().convert(data, fieldDelimiter: ';');

    // Parcourir chaque ligne du tableau CSV
    for (List<dynamic> row in csvTableau) {
      String matiere = row[0].toString(); // Nom de la matière
      List<double?> notes = row.skip(1).map((note) => double.tryParse(note.toString())).toList();
      // Skip le premier élément (nom de la matière) et convertir les notes en double

      // Filtrer les notes vides
      notes = notes.where((note) => note != null).toList();

      // Calculer la moyenne des notes
      double sum = notes.fold(0, (previous, current) => previous + (current ?? 0));
      double moyenne;

      if (notes.isNotEmpty) {
        moyenne = sum / notes.length;
      } else {
        moyenne = 0; // Si aucune note n'est disponible, la moyenne est de 0
      }

      // Ajouter la moyenne à la liste des moyennes
      averages.add(moyenne.toStringAsFixed(2)); // Formater la moyenne avec deux décimales
    }

    return averages; // Retourner la liste des moyennes
  }



  // afficher la moy gen

  Future<String> calculerMoyenneGenerale() async {
    List<String> averages = await AfficherMoyennes();

    if (averages.isEmpty) {
      return "Aucune moyenne disponible";
    }

    double sum = 0;
    int count = 0;

    for (String moyenne in averages) {
      double moyenneParsed = double.tryParse(moyenne) ?? 0;
      sum += moyenneParsed;
      count++;
    }

    double moyenneGenerale = sum / count;

    return moyenneGenerale.toStringAsFixed(2);
  }


}






