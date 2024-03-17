import 'package:flutter/material.dart';
import 'colors.dart';

class Entete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 220.0,
      top: 16.5,
      child: Text(
        'Tableau de bord',
        style: TextStyle(
          color: AppColors().grisFonce, // Couleur du texte
          fontWeight: FontWeight.bold, // Texte en gras
          fontSize: 15.0, // Taille de police
          fontFamily: 'Regular', // Famille de polices
        ),
      ),
    );
  }
}
