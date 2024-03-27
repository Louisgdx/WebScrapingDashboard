import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';



// Classe représentant les données d'absence
class AbsenceData {
  final DateTime month;
  final int absences;

  AbsenceData(this.month, this.absences);
}

// Classe représentant le widget Suivi des absences
class SuiviAbsences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Données d'absence (à titre d'exemple)
    var data = [
      AbsenceData(DateTime(2023, 1), 100),
      AbsenceData(DateTime(2023, 2), 8),
      AbsenceData(DateTime(2023, 3), 3),
      AbsenceData(DateTime(2023, 4), 6),
      AbsenceData(DateTime(2023, 5), 7),
      AbsenceData(DateTime(2023, 6), 4),
    ];

    // Définir la série pour le graphique
    var series = [
      charts.Series<AbsenceData, DateTime>(
        id: 'Absences',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (AbsenceData data, _) => data.month,
        measureFn: (AbsenceData data, _) => data.absences,
        data: data,
      )
    ];

    // Créer le graphique avec un LineChart
    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );

    // Retourner le graphique enveloppé dans un conteneur avec les paramètres de positionnement
    return Positioned(
      top: 290,
      left: 670,
      child: Container(
        width: 520,
        height: 250,
        child: chart,
      ),
    );
  }
}
