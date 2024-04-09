import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '/data/mat.dart';
import '/colors.dart';

class AppointmentWithStyle {
  final String subject;
  final TextStyle textStyle;
  final DateTime startTime;
  final DateTime endTime;
  final Color textColor;

  AppointmentWithStyle({
    required this.subject,
    required this.textStyle,
    required this.startTime,
    required this.endTime,
    required this.textColor,
  });
}

class MyCalendarDataSource extends CalendarDataSource<AppointmentWithStyle> {
  final DateTime jourSelectionne;

  MyCalendarDataSource(this.jourSelectionne) {
    appointments = <AppointmentWithStyle>[];
    getCalendarAppointments();
  }

  Future<void> getCalendarAppointments() async {
    List<String> cours = await Mat.getFirstElements();
    List<String> courss = cours.map((cour) => cour.split(';')[0]).toList();

    List<String> matieresDuJour = [];
    if (courss.length <= 4) {
      matieresDuJour.addAll(cours);
    } else {
      cours.shuffle();
      matieresDuJour = courss.sublist(0, 4);
    }

    DateTime previousEnd = DateTime(
        jourSelectionne.year, jourSelectionne.month, jourSelectionne.day, 8, 0);
    DateTime pauseStart = DateTime(
        jourSelectionne.year, jourSelectionne.month, jourSelectionne.day, 12,
        0);
    DateTime pauseEnd = DateTime(
        jourSelectionne.year, jourSelectionne.month, jourSelectionne.day, 14,
        0);

    for (int i = 0; i < matieresDuJour.length; i++) {
      int randomHour = Random().nextInt(6); // 0 à 5
      int randomMinute = Random().nextInt(60);
      DateTime randomStart = previousEnd.add(
          Duration(hours: randomHour, minutes: randomMinute));

      // Si le cours commence pendant la pause, décaler le début après la pause
      if (randomStart.isAfter(pauseStart) && randomStart.isBefore(pauseEnd)) {
        randomStart = pauseEnd;
      }

      // Calculer une durée aléatoire entre 1 et 3 heures
      int randomDuration = Random().nextInt(3) + 1;
      DateTime randomEnd = randomStart.add(Duration(hours: randomDuration));

      AppointmentWithStyle appointment = AppointmentWithStyle(
        subject: matieresDuJour[i],
        textStyle: TextStyle(color: AppColors().grisFonce),
        startTime: randomStart,
        endTime: randomEnd,
        textColor: Colors.black,
      );
      appointments?.add(appointment);

      // Mettre à jour previousEnd pour le prochain cours
      previousEnd = randomEnd;
    }
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime;
  }

  @override
  bool isAllDay(int index) {
    return false;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {
    return Colors.indigo.shade200;
  }

  @override
  TextStyle? getTextStyle(int index) {
    return appointments![index].textStyle;
  }
}
