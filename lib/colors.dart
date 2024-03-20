import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  final bleuClair = Colors.blue.shade100;
  final grisFonce = Colors.grey.shade800;
  final bleuFonce = Colors.lightBlue.shade400;

  final violetClair = Colors.indigo.shade100;

  final gradient = LinearGradient(
    colors: [
      Colors.lightBlue.shade300,
      Colors.indigo.shade200,
      Colors.yellow.shade100,
    ],
  );
}


