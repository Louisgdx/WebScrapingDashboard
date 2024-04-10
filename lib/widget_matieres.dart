import 'package:flutter/material.dart';
import 'colors.dart';
import 'matieres.dart';

class WidgetMatieres extends StatefulWidget {
  final VoidCallback showDialogCallback;

  WidgetMatieres({required this.showDialogCallback});

  @override
  _WidgetMatieresState createState() => _WidgetMatieresState();
}

class _WidgetMatieresState extends State<WidgetMatieres> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.showDialogCallback();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 47.0,
          left: 640.0,
        ),
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isHovered ? 560.0 : 550.0,
                height: isHovered ? 220.0 : 210.0,
                decoration: BoxDecoration(
                  color: AppColors().bleuClair,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors().grisFonce.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.indigo.shade200.withOpacity(0.9),
                      BlendMode.color, // Utilisez le mode de mélange de couleur
                    ),
                    child: Image.asset(
                      'assets/images/cours.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  'Résultats > ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}