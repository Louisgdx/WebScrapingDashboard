import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'colors.dart';

class AbsenceData {
  final DateTime date; // Garder la propriété date
  final int absences;
  final int bubbleSize;

  AbsenceData(this.date, this.absences, this.bubbleSize);
}

class SuiviAbsences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR');

    // Formater la date de début en français
    DateFormat dateFormat = DateFormat.yMMMMd('fr_FR');
    String startDateFormatted = dateFormat.format(DateTime(2024, 1, 1));

    DateTime currentDate = DateTime.now();

    var random = Random();
    var data = [
      for (DateTime date = DateTime(2024, 1, 1); date.isBefore(currentDate); date = date.add(Duration(days: 7)))
        AbsenceData(
          date,
          random.nextInt(50),
          5 + (random.nextInt(10) * 2), // Ajuster la taille de la bulle en fonction du nombre d'absences
        ),
    ];

    // Filtrer les données pour ne pas inclure les semaines avec 0 absences
    var filteredData = data.where((absence) => absence.absences > 0).toList();

    var series = [
      charts.Series<AbsenceData, DateTime>(
        id: 'Absences',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.indigo.shade200),
        domainFn: (AbsenceData data, _) => data.date, // Utiliser la propriété date ici
        measureFn: (AbsenceData data, _) => data.absences,
        radiusPxFn: (AbsenceData data, _) => data.bubbleSize.toDouble(),
        data: filteredData, // Utiliser les données filtrées
        // Ajouter une fonction pour afficher les tooltips
        labelAccessorFn: (AbsenceData row, _) => '${row.absences}', // Utilisation des labels par défaut pour afficher les tooltips
      )
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      defaultRenderer: charts.PointRendererConfig(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false, // Retirer l'axe des ordonnées
      ),
      domainAxis: charts.DateTimeAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12,
            color: charts.ColorUtil.fromDartColor(AppColors().grisFonce),
          ),
        ),
        tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
          day: charts.TimeFormatterSpec(
            format: 'd',
            transitionFormat: 'dd/MM',
          ),
          month: charts.TimeFormatterSpec(
            format: 'MMM',
            transitionFormat: 'MMM',
          ),
        ),
      ),
      // Activer les tooltips
      behaviors: [
        charts.LinePointHighlighter(
          symbolRenderer: charts.CircleSymbolRenderer(),
          showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.none,
          showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
        )
      ],
    );

    return Stack(
      children: [
        Positioned(
          bottom: 30.0,
          right: 100.0,
          child: Container(
            width: 520,
            height: 250,
            child: chart,
          ),
        ),
        Positioned(
          bottom: 275.0,
          right: 320.0,
          child: Text(
            'Absences', // Afficher la date de début formatée en français
            style: TextStyle(
              color: AppColors().grisFonce,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}

