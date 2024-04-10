import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '/data/moy.dart';
import '/data/mat.dart';

class WidgetMoyenneGen extends StatefulWidget {
  @override
  _WidgetMoyenneGenState createState() => _WidgetMoyenneGenState();
}

class _WidgetMoyenneGenState extends State<WidgetMoyenneGen> {
  bool isHovered = false;
  String currentDate = ''; // Stocker la date actuelle
  String currentTime = ''; // Stocker l'heure actuelle
  String moyenneGenerale = ''; // Stocker la moyenne générale

  @override
  void initState() {
    super.initState();
    // Appeler la méthode pour mettre à jour la date et l'heure lors de l'initialisation du widget
    _updateDateTime();
    _updateMoyenneGenerale();
  }

  // Méthode pour mettre à jour la date et l'heure actuelles
  void _updateDateTime() {
    // Obtenir la date et l'heure actuelles
    currentDate = Moy.getCurrentDate();
    currentTime = Moy.getCurrentTime();

    // Mettre à jour l'affichage toutes les secondes
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        // Vérifier si le widget est toujours monté avant de mettre à jour l'état
        setState(() {
          currentDate = Moy.getCurrentDate();
          currentTime = Moy.getCurrentTime();
        });
        _updateDateTime(); // Appeler la méthode récursivement pour mettre à jour continuellement
      }
    });
  }

  // Méthode pour mettre à jour la moyenne générale
  void _updateMoyenneGenerale() async {
    String moyenne = await Mat().calculerMoyenneGenerale();
    setState(() {
      moyenneGenerale = moyenne;
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
                  color: AppColors().bleuClair.withOpacity(0.7), // Couleur de fond semi-transparente
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
                    'Bienvenue John !',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 45.0, // Position verticale du texte par rapport au haut du conteneur
                left: 10.0, // Position horizontale du texte par rapport à la gauche du conteneur
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    RotateAnimatedText(

                      'Moyenne générale : $moyenneGenerale/20',

                      textStyle: TextStyle(
                        color: Colors.white, // Couleur du texte
                        fontSize: 20.0, // Taille de la police
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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