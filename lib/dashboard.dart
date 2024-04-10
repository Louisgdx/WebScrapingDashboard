import 'dart:ui';
import 'package:dashboard_bouarour_fodouop_gaudeaux/affichage_edt.dart';
import 'package:dashboard_bouarour_fodouop_gaudeaux/affichage_messages.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'marge_gauche.dart';
import 'entete.dart';
import 'widget_autre.dart';
import 'widget_edt.dart';
import 'widget_matieres.dart';
import 'widget_moyenne_gen.dart';
import 'matieres.dart';
import 'suivi.dart';
import 'widget_absences.dart';
import 'affichage_edt.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppColors().gradient,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.transparent, // La couleur d'arrière-plan
                child: Opacity(
                  opacity: 0.3, // Ajustez l'opacité de l'image
                  child: Image.asset('assets/images/photo_dash2.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Entete(), // Appel de la classe Entete pour afficher l'en-tête
          WidgetMatieres(
            showDialogCallback: () {
              _showMatieresDialog(context);
            },
          ), // Appel de la classe WidgetMatieres pour afficher les matières
          WidgetMoyenneGen(), // Appel de la classe WidgetMoyenneGen pour afficher la moyenne générale
           // Appel de la classe WidgetAutre pour afficher les autres widgets
          WidgetEdt(), // Appel de la classe WidgetEdt pour afficher l'emploi du temps
          MargeGauche(), // Appel de la classe MargeGauche pour afficher la marge gauche
          WidgetAbs(),
          SuiviAbsences(),



        ],
      ),
    );
  }

  void _showMatieresDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.transparent, // Transparent pour permettre au dégradé de passer à travers
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: AppColors().gradient, // Dégradé de couleur en arrière-plan
            ),
            child: Matieres(), // Appel de la classe Matieres pour afficher la liste des matières
          ),
        );
      },
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

