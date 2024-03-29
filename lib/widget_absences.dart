import 'package:flutter/material.dart';
import 'colors.dart';


class WidgetAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.0,
      right: 80.0,
      child: Container(
        width: 560,
        height: 280,
        decoration: BoxDecoration(
          color: AppColors().bleuClair.withOpacity(0.2), // Opacité de 0.5
        ),
      ),
    );
  }
}
