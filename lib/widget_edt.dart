import 'package:flutter/material.dart';
import 'colors.dart';



class WidgetEdt extends StatefulWidget {
  @override
  _WidgetEdtState createState() => _WidgetEdtState();
}

class _WidgetEdtState extends State<WidgetEdt> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column( // Encapsuler dans une Column
      children: [
        Container( // Utiliser Container pour margin si nécessaire
          margin: EdgeInsets.only(
            top: 200.0,
            left: 140.0,
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: isHovered ? 450.0 : 440.0,
              height: isHovered ? 380.0 : 370.0,
              decoration: BoxDecoration(
                color: AppColors().bleuClair.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: -2,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
