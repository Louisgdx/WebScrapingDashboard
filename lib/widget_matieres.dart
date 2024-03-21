import 'package:flutter/material.dart';
import 'colors.dart';
import 'matieres.dart';

class WidgetMatieres extends StatefulWidget {
  @override
  _WidgetMatieresState createState() => _WidgetMatieresState();
}

class _WidgetMatieresState extends State<WidgetMatieres> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _showMatieresDialog(context);
        },
        child: Container(
          margin: EdgeInsets.only(
            top: 47.0, // Position verticale du widget
            left: 640.0, // Position horizontale du widget
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
                // Conteneur animé pour réagir au survol de la souris
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  width: isHovered ? 240.0 : 230.0, // Largeur du widget gonflé
                  height: isHovered ? 220.0 : 210.0, // Hauteur du widget gonflé
                  decoration: BoxDecoration(
                    color: AppColors().bleuClair, // Couleur de fond
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
                ),
                // Image en arrière-plan avec un peu de transparence
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        AppColors().bleuClair.withOpacity(0.9), // Couleur blanche avec une opacité de 0.2
                        BlendMode.dstATop, // Mode de fusion pour appliquer la transparence
                      ),
                      child: Image.asset(
                        'assets/images/matieres.png', // Chemin de l'image
                        fit: BoxFit.cover, // Remplir tout l'espace disponible
                      ),
                    ),
                  ),
                ),
                // Affichage du Tooltip lorsque survolé
                if (isHovered)
                  Positioned.fill(
                    child: Center(
                      child: Tooltip(
                        message: 'Cours',
                        textStyle: TextStyle(
                          fontSize: 20.0, // Augmentation de la taille du texte
                          color: Colors.white, // Couleur du texte
                        ),
                        decoration: BoxDecoration(
                          color: AppColors().grisFonce, // Couleur de fond du Tooltip
                          borderRadius: BorderRadius.circular(8.0), // Coins arrondis du Tooltip
                        ),
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMatieresDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent, // Transparent pour permettre au dégradé de passer à travers
          child: Matieres(), // Appel de la classe Matieres pour afficher la liste des matières
        );
      },
    );
  }
}
