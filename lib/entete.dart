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
                iconSize: 30.0,
                onPressed: () {
                  // Action lorsque vous appuyez sur l'icône de paramètres
                },
                icon: SvgPicture.asset(
                  'assets/icones/settings.svg',
                  color: AppColors().grisFonce,
                  height: 20.0,
                  width: 20.0,
                ),
              ),
              SizedBox(width: 18), // Espacement entre les icônes
              IconButton(
                iconSize: 30.0,
                onPressed: () {
                  // Action lorsque vous appuyez sur l'icône de notification
                },
                icon: Icon(
                  Icons.notifications,
                  color: AppColors().grisFonce,
                ),
              ),
              SizedBox(width: 16), // Espacement entre les icônes
              Builder(
                builder: (context) => IconButton(
                  iconSize: 32.0, // Augmente la taille de l'icône
                  icon: Icon(Icons.account_circle),
                  color: AppColors().grisFonce,
                  tooltip: 'Mon compte',
                  // Ajout du menu au onPressed
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(0, 50, 0, 0),
                      items: [
                        PopupMenuItem(
                          child: Text('Mon Compte'),
                          value: 'Mon Compte',
                        ),
                        PopupMenuItem(
                          child: Text('Déconnexion'),
                          value: 'Déconnexion',
                        ),
                      ],
                    ).then((value) {
                      if (value == 'Mon Compte') {
                        // Action lorsque "Mon Compte" est sélectionné
                      } else if (value == 'Déconnexion') {
                        // Action lorsque "Déconnexion" est sélectionné
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

