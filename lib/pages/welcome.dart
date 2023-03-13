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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: ListView(
          children: [
            Text(
              'WELCOME',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontSize: 50,
                fontFamily: 'Prompt',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Image.network(
              'https://sv1.picz.in.th/images/2023/03/13/ePBskq.png',
              height: 300,
              width: 350,
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
                style: TextStyle(fontSize: 20, fontFamily: 'Prompt', color: Colors.white),
              ),
              style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 96, 125,139),
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
                style: TextStyle(fontSize: 20, fontFamily: 'Prompt', color: Color.fromARGB(255, 85, 85, 85)),
              ),
              style: ButtonStyle(
                 fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 186, 226, 246)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 186, 226, 246),
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
