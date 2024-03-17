import 'package:flutter/material.dart';
import 'colors.dart';

class MargeHaut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Fond transparent
      elevation: 0, // Pas d'ombre sur l'AppBar
      centerTitle: false, // Désactive le centrage automatique du titre
      leading: Padding(
        padding: EdgeInsets.only(left: 50.0), // Ajustement du padding pour décaler le titre vers la gauche
        child: Text(
          'Tableau de bord',
          style: TextStyle(
            color: AppColors().grisFonce, // Couleur du texte
            fontWeight: FontWeight.bold, // Texte en gras
            fontSize: 13.0, // Taille de police
            fontFamily: 'Regular', // Famille de polices
          ),
        ),
      ),
    );
  }
}
