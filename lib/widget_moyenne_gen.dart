import 'package:flutter/material.dart';
import 'colors.dart';



class WidgetMoyenneGen extends StatefulWidget {
  @override
  _WidgetMoyenneGenState createState() => _WidgetMoyenneGenState();
}

class _WidgetMoyenneGenState extends State<WidgetMoyenneGen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 60.0, // Position verticale du widget
          left: 200.0, // Position horizontale du widget
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
            width: isHovered ? 440.0 : 430.0, // Largeur du widget gonflé
            height: isHovered ? 130.0 : 120.0, // Hauteur du widget gonflé
            decoration: BoxDecoration(
              color: AppColors().bleuClair.withOpacity(0.8), // Couleur de fond semi-transparente
              borderRadius: BorderRadius.circular(10.0), // Coins arrondis
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Couleur de l'ombre (effet de reflet)
                  spreadRadius: -2, // Étendue de l'ombre (vers l'intérieur)
                  blurRadius: 6, // Flou de l'ombre
                  offset: Offset(0, 3), // Décalage de l'ombre (vers le bas)
                ),
              ],
            ),
            // Vous pouvez ajouter d'autres widgets à l'intérieur de ce conteneur si nécessaire
          ),
        ),
      ),
    );
  }
}
