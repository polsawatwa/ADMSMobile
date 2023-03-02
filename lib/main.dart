import 'package:admsmobile/pages/login.dart';
import 'package:flutter/material.dart';
import 'pages/collection.dart';
import 'pages/aboutUs.dart';
import 'pages/home.dart';
import 'pages/login.dart';

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
      home: LoginPage(),
      
    );
  }
  }



