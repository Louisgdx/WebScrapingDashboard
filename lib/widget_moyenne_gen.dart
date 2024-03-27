import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'colors.dart'; // Importer la classe AppColors

class WidgetMoyenneGen extends StatefulWidget {
  @override
  _WidgetMoyenneGenState createState() => _WidgetMoyenneGenState();
}

class _WidgetMoyenneGenState extends State<WidgetMoyenneGen> {
  bool isHovered = false;
  String currentDate = ''; // Stocker la date actuelle
  String currentTime = ''; // Stocker l'heure actuelle

  @override
  void initState() {
    super.initState();
    // Appeler les méthodes pour obtenir la date et l'heure lors de l'initialisation du widget
    _getCurrentDateAndTime();
  }

  // Méthode pour obtenir la date et l'heure actuelles
  void _getCurrentDateAndTime() {
    setState(() {
      // Ici, vous devez obtenir la date et l'heure actuelles
      currentDate = "Mercredi 27 mars"; // Remplacer par la méthode réelle pour obtenir la date
      currentTime = "14:30"; // Remplacer par la méthode réelle pour obtenir l'heure
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
                  color: AppColors().bleuClair.withOpacity(0.9), // Couleur de fond semi-transparente
                  borderRadius: BorderRadius.circular(10.0), // Coins arrondis
                  boxShadow: [
                    BoxShadow(
                      color: AppColors().grisFonce.withOpacity(0.1), // Couleur de l'ombre (effet de reflet)
                      spreadRadius: -2, // Étendue de l'ombre (vers l'intérieur)
                      blurRadius: 6, // Flou de l'ombre
                      offset: Offset(0, 3), // Décalage de l'ombre (vers le bas)
                    ),
                  ],
                ),
                // Vous pouvez ajouter d'autres widgets à l'intérieur de ce conteneur si nécessaire
              ),
              Positioned(
                top: 10.0, // Position verticale du texte par rapport au haut du conteneur
                left: 10.0, // Position horizontale du texte par rapport à la gauche du conteneur
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return AppColors().gradient.createShader(bounds); // Utiliser le dégradé de la classe AppColors
                  },
                  child: Text(
                    'Bienvenue Prénom !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50.0, // Position verticale du texte par rapport au haut du conteneur
                left: 10.0, // Position horizontale du texte par rapport à la gauche du conteneur
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText(
                      currentDate,
                      textStyle: TextStyle(
                        color: Colors.white, // Couleur du texte
                        fontSize: 20.0, // Taille de la police
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotateAnimatedText(
                      currentTime,
                      textStyle: TextStyle(
                        color: Colors.white, // Couleur du texte
                        fontSize: 20.0, // Taille de la police
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
