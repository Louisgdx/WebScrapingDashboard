import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'colors.dart';

class AbsenceData {
  final DateTime startDate;
  final DateTime endDate;
  final int absences;
  final int bubbleSize;

  AbsenceData(this.startDate, this.endDate, this.absences, this.bubbleSize);
}

class SuiviAbsences extends StatelessWidget {
  List<AbsenceData> generateAbsenceData() {
    initializeDateFormatting('fr_FR');

    DateFormat dateFormat = DateFormat.yMMMMd('fr_FR');
    String startDateFormatted = dateFormat.format(DateTime(2024, 1, 1));

    DateTime currentDate = DateTime.now();

    var random = Random();
    var data = [
      for (DateTime date = DateTime(2024, 1, 1); date.isBefore(currentDate); date = date.add(Duration(days: 7)))
        AbsenceData(
          date,
          date.add(Duration(days: 6)),
          min(random.nextInt(25), 25), // Limiter le nombre d'absences à 25 maximum
          5 + (random.nextInt(10) * 2),
        ),
    ];

    return data.where((absence) => absence.absences > 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<AbsenceData> filteredData = generateAbsenceData();

    var series = [
      charts.Series<AbsenceData, DateTime>(
        id: 'Absences',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.indigo.shade300),
        domainFn: (AbsenceData data, _) => data.startDate,
        measureFn: (AbsenceData data, _) => data.absences,
        radiusPxFn: (AbsenceData data, _) => data.bubbleSize.toDouble(),
        data: filteredData,
        labelAccessorFn: (AbsenceData row, _) => '${row.absences}',
      )
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      defaultRenderer: charts.PointRendererConfig(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        viewport: charts.NumericExtents(0, 25), // Limiter l'axe des ordonnées de 0 à 25
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
      behaviors: [
        charts.LinePointHighlighter(
          symbolRenderer: charts.CircleSymbolRenderer(),
          showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.none,
          showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
        ),
        charts.SelectNearest(eventTrigger: charts.SelectionTrigger.tapAndDrag),
      ],
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (charts.SelectionModel model) {
            if (model.hasDatumSelection) {
              var selectedDatum = model.selectedDatum.first;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Absences'),
                    content: Text(
                      'Nombre d\'absences du \n${DateFormat.yMMMMd('fr_FR').format(selectedDatum.datum.startDate)} au ${DateFormat.yMMMMd('fr_FR').format(selectedDatum.datum.endDate)} : \n${selectedDatum.datum.absences}',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Fermer'),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
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
          right: 325.0,
          child: Text(
            'Absences',
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
