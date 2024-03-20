import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors.dart';


// partie du haut du dashboard pour afficher l'icone parametres, notification et la photo de profil

class Entete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 220.0,
      top: 16.5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Tableau de bord',
              style: TextStyle(
                color: AppColors().grisFonce, // Couleur du texte
                fontWeight: FontWeight.bold, // Texte en gras
                fontSize: 15.0, // Taille de police
                fontFamily: 'Regular', // Famille de polices
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Action lorsque vous appuyez sur l'icône
              // Ajoutez votre logique ici
            },
            child: SvgPicture.asset(
              'assets/icones/settings.svg', // Chemin de votre fichier SVG
              color: AppColors().grisFonce, // Couleur de l'icône
              height: 20.0, // Hauteur de l'icône
              width: 20.0, // Largeur de l'icône
            ),
          ),
        ],
      ),
    );
  }
}
