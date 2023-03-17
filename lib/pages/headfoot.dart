import 'package:flutter/material.dart';
import 'collection.dart';
import 'aboutUs.dart';
import 'home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CurvePage extends StatefulWidget {
  final userType;
  const CurvePage({Key? key, required this.userType}) : super(key: key);
  @override
  State<CurvePage> createState() => _CurvePageState();
}

class _CurvePageState extends State<CurvePage> {
  @override
  int _currentIndex = 0;
  // bool userType_status = widget.userType;
  final tabs = [HomePage(), collectionPage(userType: true,), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Image.asset(
              'assets/head.png',
              height: 50,
            ),
            SizedBox(width: 8),
            Text("ADMS",style: TextStyle(fontSize: 20, fontFamily: 'Prompt'),),        
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.transparent,
        color: Theme.of(context).accentColor,
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
