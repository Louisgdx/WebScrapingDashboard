import 'package:flutter/material.dart';
import 'colors.dart';

class MargeGauche extends StatelessWidget {
  final Widget child;

  MargeGauche({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().bleuClair,
      height: MediaQuery.of(context).size.height,
      width: 150, // Largeur de la marge gauche
      padding: EdgeInsets.all(16.0), // Ajout de padding pour espacement interne
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tableau de bord',
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
    );
  }
}
