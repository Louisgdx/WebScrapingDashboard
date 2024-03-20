import 'package:flutter/material.dart';
import 'colors.dart';

class MargeGauche extends StatelessWidget {
  final Widget? child;

  MargeGauche({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: AppColors().bleuClair,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Navigator',
            style: TextStyle(
              color: AppColors().grisFonce,
              fontWeight: FontWeight.bold,
              fontSize: 12.0,
              fontFamily: 'Regular',
            ),
          ),
          SizedBox(height: 16.0),
          if (child != null) Expanded(child: child!),
        ],
      ),
    );
  }
}

