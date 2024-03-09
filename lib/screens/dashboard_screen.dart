import 'package:flutter/material.dart';


class DashboardScreen extends StatefulWidget {
  const Dashboard{(key? key)} : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState() ;
}

class _DashboardScreenState extends State<DashboardScreen> {
   @override
   Widget build(BuildContext context) {
   // structure de l'interface utilsateur
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(destinations, selectIndex)
            ],
   )
   )
}
}