import 'package:flutter/material.dart';
import 'colors.dart';
import 'matieres.dart'; // Import de la classe Matieres pour afficher la fenêtre

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
                width: isHovered ? 240.0 : 230.0,
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
                      AppColors().bleuClair.withOpacity(0.9),
                      BlendMode.dstATop,
                    ),
                    child: Image.asset(
                      'assets/images/matieres.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (isHovered)
                Positioned.fill(
                  child: Center(
                    child: Tooltip(
                      message: 'Cours',
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors().grisFonce,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        height: double.infinity,
                      ),
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
