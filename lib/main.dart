import 'package:flutter/material.dart';
import 'pages/collection.dart';
import 'pages/aboutUs.dart';
import 'pages/home.dart';
import 'pages/headfoot.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff7286D3),
        accentColor: Color(0xff7286D3),
        brightness: Brightness.light,
      ),
      home: CurvePage(),
    );
  }
  }



