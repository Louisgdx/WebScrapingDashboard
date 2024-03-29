import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colors.dart';

class AffichageEdt extends StatelessWidget {
  final DateTime jourSelectionne;

  AffichageEdt(this.jourSelectionne);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(100.0),
        decoration: BoxDecoration(
          gradient: AppColors().gradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Emploi du temps du ${DateFormat('dd/MM/yyyy').format(jourSelectionne)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Ajoutez ici le contenu pour la date sélectionnée',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Fermer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
