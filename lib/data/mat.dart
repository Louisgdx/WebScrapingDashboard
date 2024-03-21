import 'package:flutter/services.dart' show rootBundle;

class Mat {
  static Future<List<String>> getMatiereList() async {
    String fileContent = await rootBundle.loadString('assets/bdd/notes2.csv');
    List<String> lines = fileContent.split('\n');
    List<String> matieres = [];
    for (String line in lines) {
      List<String> values = line.split(';');
      if (values.isNotEmpty) {
        matieres.add(values[0]);
      }
    }
    return matieres;
  }
}
