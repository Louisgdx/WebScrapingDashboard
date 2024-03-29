import 'package:flutter/material.dart';
import 'colors.dart';

class MargeGauche extends StatelessWidget {
  final Widget? child;

  MargeGauche({this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Widget rectangulaire à gauche
        Positioned(
          left: 0,
          top: MediaQuery.of(context).size.height / 2 - 200, // Position verticale centrée
          child: Container(
            width: 60, // Ajustement de la largeur du conteneur
            height: 340,
            decoration: BoxDecoration(
              color: AppColors().bleuClair,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icône Home entourée d'un cercle blanc
                Tooltip(
                  message: 'Tableau de bord', // Message du Tooltip
                  child: Container(
                    padding: EdgeInsets.all(6), // Marge intérieure pour le cercle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Forme circulaire
                      color: Colors.white, // Couleur de fond blanche
                    ),
                    child: Icon(
                      Icons.home,
                      color: AppColors().grisFonce,
                    ),
                  ),
                ),
                SizedBox(height: 10), // Espacement entre l'icône et le texte

                // Bouton Messages
                Tooltip(
                  message: 'Messages',
                  child: IconButton(
                    icon: Icon(Icons.message),
                    onPressed: () {
                      // Action lors de l'appui sur le bouton Messages
                    },
                  ),
                ),
                // Icône flèche retour en arrière
                Tooltip(
                  message: 'Consulté Récemment',
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône de retour
                    },
                  ),
                ),
                // Icône point d'interrogation
                Tooltip(
                  message: 'Aide',
                  child: IconButton(
                    icon: Icon(Icons.help_outline),
                    onPressed: () {
                      // Action lors de l'appui sur l'icône d'aide
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Texte au-dessus à droite
        Positioned(
          left: 12,
          top: 10,
          child: Text(
            'Learning Navigator',
            style: TextStyle(
              color: AppColors().grisFonce,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
              fontFamily: 'Regular',
            ),
          ),
        ),
        // Contenu fourni
        if (child != null) Positioned.fill(child: child!),
      ],
    );
  }
}
