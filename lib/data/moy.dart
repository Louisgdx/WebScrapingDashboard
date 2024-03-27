import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Moy {
  static String getCurrentDate() {
    // Obtention de la date actuelle
    DateTime now = DateTime.now();

    // Formatage de la date selon le format souhaité
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    return formattedDate;
  }

  static String getCurrentTime() {
    // Obtention de l'heure actuelle
    DateTime now = DateTime.now();

    // Formatage de l'heure selon le format souhaité
    String formattedTime = DateFormat('HH:mm').format(now);

    return formattedTime;
  }


}

