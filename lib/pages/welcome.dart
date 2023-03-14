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
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        backgroundColor: Color(0xFF7286D3),
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
            Image.network(
              'https://media.discordapp.net/attachments/803213415094681640/1077938339497398272/logo5.png?width=1038&height=456',
              height: 250,
              width: 250,
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
                style: TextStyle(fontSize: 20, fontFamily: 'Prompt', color: Color.fromARGB(255, 255, 255, 255)),
              ),
              style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF6F00)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    width: 2,
                    color: Color(0xFFFF6F00),
                  ),
                ),
      
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurvePage()),
                );
              },
              child: Text(
                'เข้าสู่ระบบโดยไม่มีบัญชี',
                style: TextStyle(fontSize: 20, fontFamily: 'Prompt', color: Color.fromARGB(255, 0, 0, 0)),
              ),
              style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFF9FBE7)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    width: 2,
                    color: Color(0xFFF9FBE7),
                  ),
                ),
               
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
