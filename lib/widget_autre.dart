import 'package:flutter/material.dart';
import 'colors.dart';

class WidgetAutre extends StatefulWidget {
  @override
  _WidgetAutreState createState() => _WidgetAutreState();
}

class _WidgetAutreState extends State<WidgetAutre> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 47.0, // Position verticale du widget
          left: 910.0, // Position horizontale du widget
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
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isHovered ? 240.0 : 230.0, // Largeur du widget gonflé
                height: isHovered ? 220.0 : 210.0, // Hauteur du widget gonflé
                decoration: BoxDecoration(
                  color: AppColors().bleuClair.withOpacity(0.8), // Couleur de fond semi-transparente
                  borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  boxShadow: [
                    BoxShadow(
                      color: AppColors().grisFonce.withOpacity(0.5), // Couleur de l'ombre (effet de reflet)
                      spreadRadius: 2, // Étendue de l'ombre
                      blurRadius: 6, // Flou de l'ombre
                      offset: Offset(0, 3), // Décalage de l'ombre (vers le bas)
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.7), // Rendre l'image en noir et blanc
                      BlendMode.saturation, // Utiliser le mode de fusion de saturation
                    ),
                    child: Image.asset(
                      'assets/images/devoirs.jpg', // Chemin de l'image
                      fit: BoxFit.cover, // Ajuster l'image pour couvrir le conteneur
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 8.0,
                left: 8.0,
                child: Text(
                  'Devoirs > ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}