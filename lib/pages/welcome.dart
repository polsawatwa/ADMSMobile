import 'package:flutter/material.dart';
import 'home.dart';
import 'headfoot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF7286D3),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Text(
              'WELCOME',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 50,
                fontFamily: 'Prompt',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/logo.png',
              height: 150,
              width: 150,
            ),
            SizedBox(height: 50),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Prompt',
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(200, 50),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFF6F00)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurvePage(userType: false)),
                );
              },
              child: Text(
                'เข้าสู่ระบบโดยไม่มีบัญชี',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Prompt', color: Colors.black),
              ),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(50, 50),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFF9FBE7)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
