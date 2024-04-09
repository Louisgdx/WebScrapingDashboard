import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart'; // Importez les packages tiers d'abord
import 'profil.dart'; // Ensuite, les importations locales
import 'colors.dart'; // Ensuite, les importations locales

class Entete extends StatefulWidget {
  @override
  _EnteteState createState() => _EnteteState();
}

class _EnteteState extends State<Entete> {
  // Définissez les couleurs une seule fois pour éviter les instances multiples
  final AppColors appColors = AppColors();

  bool isSettingsHovered = false;
  bool isNotificationsHovered = false;
  bool isProfileHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            color: Colors.transparent,
            child: Text(
              'Tableau de bord',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appColors.grisFonce,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                fontFamily: 'Regular',
              ),
            ),
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          // Définir la couleur de fond comme transparente
          elevation: 5,
          // Enlever l'ombre de l'AppBar
        ),
      ],
    );
  }
}

