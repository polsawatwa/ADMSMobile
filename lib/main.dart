import 'package:admsmobile/pages/welcome.dart';
import 'package:flutter/material.dart';



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
      home: WelcomePage(),
      
    );
  }
  }



