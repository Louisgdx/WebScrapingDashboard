import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors.dart';

class Entete extends StatefulWidget {
  @override
  _EnteteState createState() => _EnteteState();
}

class _EnteteState extends State<Entete> {
  bool isSettingsHovered = false;
  bool isNotificationsHovered = false;
  bool isProfileHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 30.0),
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
                fontSize: 14.0,
                fontFamily: 'Regular',
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _showSettingsDialog(context);
                },
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isSettingsHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isSettingsHovered = false;
                    });
                  },
                  child: SvgPicture.asset(
                    'assets/icones/settings.svg',
                    color: isSettingsHovered ? Colors.blue : AppColors().grisFonce,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  // Ajoutez votre logique pour le bouton de notifications ici
                },
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isNotificationsHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isNotificationsHovered = false;
                    });
                  },
                  child: Icon(
                    Icons.notifications,
                    color: isNotificationsHovered ? Colors.blue : AppColors().grisFonce,
                  ),
                ),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () {
                  // Ajoutez votre logique pour le bouton du profil ici
                },
                child: MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isProfileHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isProfileHovered = false;
                    });
                  },
                  child: Icon(
                    Icons.account_circle,
                    color: isProfileHovered ? Colors.blue : AppColors().grisFonce,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Paramètres'),
          content: Text('Options de paramètres ici'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
