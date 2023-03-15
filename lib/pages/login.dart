import 'package:flutter/material.dart';
import 'home.dart';
import 'headfoot.dart';
import 'welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF7286D3),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            Text(
              'Login',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 50,
                fontFamily: 'Prompt',
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/icons-login.png',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 30),
            TextField(
                controller: username,
                decoration: InputDecoration(
                  filled: true,
    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.account_circle),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
            SizedBox(height: 15),
            TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(filled: true,
    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.key),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                // Send a GET request to the API endpoint to retrieve user data
                var response = await http
                    .get(Uri.parse('http://localhost:8000/api/user/'));
                if (response.statusCode == 200) {
                  // If the request is successful, parse the response body
                  var data = jsonDecode(response.body);
                  // Check if the entered username and password match any user in the API
                  var user = data.firstWhere(
                      (u) =>
                          u['username'] == username.text &&
                          u['password'] == password.text,
                      orElse: () => null);
                  if (user != null) {
                    print('Login successful');
                    setState(() {
                      setUsername(username.text);
                      setPassword(password.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CurvePage()));
                    });
                  } else {
                    print('Invalid username or password');
                     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong username or password.'),
          backgroundColor: Colors.red,
        ),
        );
                  }
                } else {

                  print("wrong username or password");
                  print('Failed to retrieve user data from the API');
                }
              },
              
              child:
                  Text('เข้าสู่ระบบ', style: TextStyle(fontFamily: 'Prompt', fontSize: 20)),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Color(0xFFFF6F00)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                 ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: Text(
                'ย้อนกลับ',
                style: TextStyle(
                  fontFamily: 'Prompt',
                  fontSize: 20,color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Color(0xFFF9FBE7)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 20, 50, 20),
                ),
              ),
            )
          ])),
    );
  }

  Future<void> setUsername(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', textUsername);
  }

  Future<void> setPassword(textPassword) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('password', textPassword);
  }
}
