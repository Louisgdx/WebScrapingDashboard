import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors.dart';

class Entete extends StatelessWidget {
  final double verticalSpacing;

  Entete({this.verticalSpacing = 4.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalSpacing, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'Tableau de bord',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors().grisFonce,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                fontFamily: 'Regular',
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  print('Settings button pressed'); // Débogage
                  // Action lorsque vous appuyez sur l'icône de paramètres
                },
                icon: SvgPicture.asset(
                  'assets/icones/settings.svg',
                  color: AppColors().grisFonce,
                  height: 23.0,
                  width: 23.0,
                ),
              ),
              SizedBox(width: 18), // Espacement entre les icônes
              IconButton(
                iconSize: 28.0,
                onPressed: () {
                  print('Notifications button pressed'); // Débogage
                  // Action lorsque vous appuyez sur l'icône de notification
                },
                icon: Icon(
                  Icons.notifications,
                  color: AppColors().grisFonce,
                ),
              ),
              SizedBox(width: 18), // Espacement entre les icônes
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  print("affichage");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
