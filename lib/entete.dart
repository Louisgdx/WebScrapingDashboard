import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'colors.dart';

class Entete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0), // Hauteur personnalisée de l'AppBar
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Tableau de bord',
                style: TextStyle(
                  color: AppColors().grisFonce,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  fontFamily: 'Regular',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                // Action lorsque vous appuyez sur l'icône de notification
              },
              icon: Icon(
                Icons.notifications,
                color: AppColors().grisFonce,
              ),
            ),
            IconButton(
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
          ],
        ),
      ),
    );
  }
}
