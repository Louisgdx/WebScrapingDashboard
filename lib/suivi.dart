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

    DateTime currentDate = DateTime.now();
    DateTime startDate = DateTime(2024, 1, 1);

    var random = Random();
    var data = [
      for (DateTime date = startDate; date.isBefore(currentDate); date = date.add(Duration(days: 7)))
        AbsenceData(
          date,
          random.nextInt(50),
          random.nextInt(30) + 5,
        ),
    ];

    var series = [
      charts.Series<AbsenceData, DateTime>(
        id: 'Absences',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.lightBlue.shade300),
        domainFn: (AbsenceData data, _) => data.date, // Utiliser la propriété date ici
        measureFn: (AbsenceData data, _) => data.absences,
        radiusPxFn: (AbsenceData data, _) => data.bubbleSize,
        data: data,
      )
    ];

    var chart = charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      defaultRenderer: charts.PointRendererConfig(),
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: true,
        renderSpec: charts.SmallTickRendererSpec(
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors().grisFonce),
          ),
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors().grisFonce),
          ),
        ),
      ),
      domainAxis: charts.DateTimeAxisSpec(
        showAxisLine: true,
        renderSpec: charts.SmallTickRendererSpec(
          lineStyle: charts.LineStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors().grisFonce),
          ),
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(AppColors().grisFonce),
          ),
        ),
      ),
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
          top: 10.0,
          left: 20.0,
          child: Text(
            'Absences',
            style: TextStyle(
              color: AppColors().grisFonce,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
