import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart'; // Importez les packages tiers d'abord
import 'profil.dart'; // Ensuite, les importations locales
import 'colors.dart'; // Ensuite, les importations locales

class Entete extends StatefulWidget {
  @override
  _EnteteState createState() => _EnteteState();
}

class _EnteteState extends State<Entete> {
  // Définissez les couleurs une seule fois pour éviter les instances multiples
  final AppColors appColors = AppColors();

  bool isSettingsHovered = false;
  bool isNotificationsHovered = false;
  bool isProfileHovered = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Définir la couleur de fond comme transparente
      elevation: 0, // Enlever l'ombre de l'AppBar
      title: Text(
        'Tableau de bord',
        style: TextStyle(
          color: appColors.grisFonce,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
          fontFamily: 'Regular',
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            // Gérer l'action de sélection
            if (value == 'Profil') {
              // Afficher la boîte de dialogue pour le profil
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    backgroundColor: Colors.transparent, // Fond transparent
                    elevation: 0, // Pas d'ombre
                    child: Profil(), // Afficher la page de profil
                  );
                },
              );
            } else if (value == 'Déconnexion') {
              // Afficher un message de déconnexion réussie
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Déconnexion réussie'),
                    content: Text('Vous avez été déconnecté avec succès.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Fermer le dialog
                          Navigator.of(context).pop(); // Fermer la boîte de dialogue

                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              // Ajouter la logique pour d'autres options si nécessaire
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Profil',
              child: Text('Profil'),
            ),
            PopupMenuItem<String>(
              value: 'Déconnexion',
              child: Text('Déconnexion'),
            ),
          ],
        ),
      ],
    );
  }
}
