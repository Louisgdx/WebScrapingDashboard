import 'package:flutter/material.dart';
import 'colors.dart';

class WidgetMatieres extends StatefulWidget {
  @override
  _WidgetMatieresState createState() => _WidgetMatieresState();
}

class _WidgetMatieresState extends State<WidgetMatieres> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200.0, // Position verticale du widget
      left: 200.0, // Position horizontale du widget
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
          width: isHovered ? 200.0 : 190.0, // Largeur du widget gonflé
          height: isHovered ? 200.0 : 190.0, // Hauteur du widget gonflé
          decoration: BoxDecoration(
            color: AppColors().bleuClair.withOpacity(0.8), // Couleur de fond semi-transparente
            borderRadius: BorderRadius.circular(10.0), // Coins arrondis
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Couleur de l'ombre (effet de reflet)
                spreadRadius: 2, // Étendue de l'ombre
                blurRadius: 6, // Flou de l'ombre
                offset: Offset(0, 3), // Décalage de l'ombre (vers le bas)
              ),
            ],
          ),
          // Vous pouvez ajouter d'autres widgets à l'intérieur de ce conteneur si nécessaire
        ),
      ),
    );
  }
}
