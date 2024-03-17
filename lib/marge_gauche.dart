import 'package:flutter/material.dart';
import 'colors.dart';

class MargeGauche extends StatelessWidget {
  final Widget child;

  MargeGauche({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // Largeur de la marge gauche
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(18.0), // Ajout de padding pour espacement interne
      decoration: BoxDecoration(
        color: AppColors().bleuClair, // Couleur bleue
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Couleur de l'ombre noire
            blurRadius: 4, // Flou de l'ombre
            offset: Offset(0, -3), // Décalage de l'ombre (vers la droite)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Navigator',
            style: TextStyle(
              color: AppColors().grisFonce, // Couleur du texte en gris
              fontWeight: FontWeight.bold,
              fontSize: 12.0, // Taille de police
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
