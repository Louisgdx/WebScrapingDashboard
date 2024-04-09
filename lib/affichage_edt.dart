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
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: AppColors().gradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Texte centré horizontalement
            SizedBox(
              width: double.infinity,
              child: Text(
                'Emploi du temps du ${DateFormat('dd/MM/yyyy').format(jourSelectionne)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors().grisFonce),
              ),
            ),
            Spacer(), // Pour pousser le bouton "Fermer" vers le bas
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
