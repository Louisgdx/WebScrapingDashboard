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
            width: 60,
            height: 400,
            decoration: BoxDecoration(
              color: AppColors().bleuClair,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
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
              fontSize: 15.0,
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
