import 'package:flutter/material.dart';
import 'colors.dart';

class MargeGauche extends StatelessWidget {
  final Widget child;

  MargeGauche({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Conteneur avec l'effet d'ombre
        Positioned(
          left: 0,
          child: Container(
            width: 150, // Largeur de la marge gauche
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Couleur de l'ombre
                  spreadRadius: 6, // Étendue de l'ombre
                  blurRadius: 8, // Flou de l'ombre
                  offset: Offset(-4, 0), // Décalage de l'ombre (vers la gauche)
                ),
              ],
            ),
          ),
        ),
        // Conteneur principal avec le contenu
        Container(
          color: AppColors().bleuClair,
          width: 170, // Largeur de la marge gauche
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(18.0), // Ajout de padding pour espacement interne
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learning Navigator',
                style: TextStyle(
                  color: AppColors().grisFonce, // Couleur du texte en gris
                  fontSize: 13.0, // Taille de police
                  fontFamily: 'Regular', // Famille de polices
                ),
              ),
              SizedBox(height: 16.0), // Espacement entre le texte et le reste du contenu
              Expanded(
                child: child, // Affichez d'autres widgets à l'intérieur si nécessaire
              ),
            ],
          ),
        ),
      ],
    );
  }
}
