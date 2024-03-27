import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'colors.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '/data/moy.dart';

class WidgetEdt extends StatefulWidget {
  @override
  _WidgetEdtState createState() => _WidgetEdtState();
}

class _WidgetEdtState extends State<WidgetEdt> {
  bool isHovered = false;
  CalendarFormat _calendarFormat = CalendarFormat.month; // CalendarFormat.month pour afficher le calendrier du mois
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = Moy.getCurrentDate(); // Obtenir la date d'aujourd'hui

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
              top: 200.0,
              left: 140.0,
            ),
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovered = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isHovered ? 450.0 : 440.0,
                height: isHovered ? 380.0 : 370.0,
                decoration: BoxDecoration(
                  color: AppColors().bleuClair.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: -2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime.utc(2010, 10, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  calendarFormat: _calendarFormat,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false, // Supprimer le bouton de changement de format
                  ),
                  locale: 'fr_FR',
                  startingDayOfWeek: StartingDayOfWeek.monday,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
