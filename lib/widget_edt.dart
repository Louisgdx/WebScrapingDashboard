import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'colors.dart';
import 'affichage_edt.dart';

class WidgetEdt extends StatefulWidget {
  @override
  _WidgetEdtState createState() => _WidgetEdtState();
}

class _WidgetEdtState extends State<WidgetEdt> {
  bool isHovered = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: isHovered ? 450.0 : 440.0,
                    height: isHovered ? 370.0 : 360.0,
                    decoration: BoxDecoration(
                      color: AppColors().bleuClair.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors().grisFonce.withOpacity(0.1),
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
                        formatButtonVisible: false,
                      ),
                      locale: 'fr_FR',
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      onDaySelected: (selectedDay, focusedDay) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AffichageEdt(selectedDay),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
