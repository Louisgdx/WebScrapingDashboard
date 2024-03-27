import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'colors.dart';
import '/data/moy.dart';

class WidgetMoyenneGen extends StatefulWidget {
  @override
  _WidgetMoyenneGenState createState() => _WidgetMoyenneGenState();
}

class _WidgetMoyenneGenState extends State<WidgetMoyenneGen> {
  bool isHovered = false;
  String currentDate = ''; // Stocker la date du jour
  String currentTime = ''; // Stocker l'heure actuelle

  @override
  void initState() {
    super.initState();
    // Appeler les méthodes pour obtenir la date et l'heure lors de l'initialisation du widget
    _getCurrentDate();
    _getCurrentTime();
  }

  // Méthode pour obtenir la date actuelle
  void _getCurrentDate() {
    setState(() {
      currentDate = Moy.getCurrentDate(); // Utilisation de la méthode de la classe Moy pour obtenir la date
    });
  }

  // Méthode pour obtenir l'heure actuelle
  void _getCurrentTime() {
    setState(() {
      currentTime = Moy.getCurrentTime(); // Utilisation de la méthode de la classe Moy pour obtenir l'heure
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 50.0, // Position verticale du widget
          left: 140.0, // Position horizontale du widget
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
                width: isHovered ? 450.0 : 440.0, // Largeur du widget gonflé
                height: isHovered ? 140.0 : 130.0, // Hauteur du widget gonflé
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
              Positioned(
                top: 0.0, // Position verticale du texte par rapport au haut du conteneur
                left: 5.0, // Position horizontale du texte par rapport à la gauche du conteneur
                child: Container(
                  width: 250, // Largeur fixe pour le widget AnimatedTextKit
                  height: 40, // Hauteur fixe pour le widget AnimatedTextKit
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Bonjour Prénom !',
                        textAlign: TextAlign.center, // Centrer le texte
                        textStyle: TextStyle(
                          color: AppColors().grisFonce, // Couleur du texte en gris foncé
                          fontSize: 20.0, // Taille de la police
                          fontFamily: 'Regular',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10.0, // Position verticale du texte par rapport au haut du conteneur
                right: 10.0, // Position horizontale du texte par rapport à la droite du conteneur
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(currentDate),
                    RotateAnimatedText(currentTime),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

