import 'package:flutter/material.dart';
import 'pages/collection.dart';
import 'pages/aboutUs.dart';
import 'pages/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // fontFamily: 'Schyler',
      theme: ThemeData(
      primarySwatch:Colors.lightBlue,
    ),
      home: MainPage()
    );
  }
}



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), collectionPage(), aboutUsPage()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ADMS")),
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.transparent,
        color: Colors.lightBlueAccent,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.collections, size: 30),
          Icon(Icons.announcement, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}