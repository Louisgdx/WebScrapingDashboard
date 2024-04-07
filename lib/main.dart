import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCWM92KG9dHr_2kLg0X46Dj2p3T6Jw1cOM",
      authDomain: "dashboardfirebase-d061a.firebaseapp.com",
      projectId: "dashboardfirebase-d061a",
      storageBucket: "dashboardfirebase-d061a.appspot.com",
      messagingSenderId: "890389351594",
      appId: "1:890389351594:web:cf0356fb317221d3f354d3",
      measurementId: "G-K1416TXF0M",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );

  }
}








