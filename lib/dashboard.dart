import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'marge_gauche.dart';
import 'entete.dart';
import 'widget_calendrier.dart';
import 'widget_edt.dart';
import 'widget_matieres.dart';
import 'widget_autre.dart';
import 'widget_moyenne_gen.dart';
import 'colors.dart';

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
                  child: Image.asset('assets/photo_dash2.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Entete(),
          WidgetMatieres(),
          WidgetMoyenneGen(),
          WidgetAutre(),
          WidgetCalendrier(),
          WidgetEdt(),
          MargeGauche(),
        ],
      ),
    );
  }
}


