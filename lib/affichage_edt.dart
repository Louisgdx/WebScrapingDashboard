import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colors.dart';
import '/data/mat.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'data/edt.dart';

class AffichageEdt extends StatefulWidget {
  final DateTime jourSelectionne;

  AffichageEdt(this.jourSelectionne);

  @override
  _AffichageEdtState createState() => _AffichageEdtState();
}

class _AffichageEdtState extends State<AffichageEdt> {
  late DateTime jourSelectionne;

  @override
  void initState() {
    jourSelectionne = widget.jourSelectionne;
    super.initState();
  }

  @override
  void didUpdateWidget(AffichageEdt oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.jourSelectionne != jourSelectionne) {
      setState(() {
        jourSelectionne = widget.jourSelectionne;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: AppColors().gradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Emploi du temps du ${DateFormat('dd/MM').format(jourSelectionne)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors().grisFonce),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SfCalendar(
              key: ValueKey(jourSelectionne), // Utilisez une ValueKey avec la date sélectionnée comme valeur pour forcer la reconstruction du widget
              view: CalendarView.day,
              dataSource: MyCalendarDataSource(jourSelectionne),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Fermer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
