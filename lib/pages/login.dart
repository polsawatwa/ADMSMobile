import 'package:flutter/material.dart';
import 'home.dart';
import 'headfoot.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
          body: ListView(children: [
        // Text(
        //   'Login',
        //   style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       color: Colors.blueGrey,
        //       fontSize: 30),
        //   textAlign: TextAlign.center,
        // ),
        SizedBox(height: 30),
        Image.network(
          'https://cdn-icons-png.flaticon.com/512/295/295128.png',
          height: 150,
          width: 150,
        ),
        
        SizedBox(height: 30),
        Text(
          'Login',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
              fontSize: 30),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        TextField(
            controller: username,
            decoration: InputDecoration(
                labelText: 'UserName', border: OutlineInputBorder())),
        SizedBox(height: 15),
        TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password', border: OutlineInputBorder())),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (username.text == 'super_admin' && password.text == 'Spa#1478') {
              print("Username = super_admin and Password = Spa#1478");
              setState(() {
                username.text = 'super_admin';
                password.text = 'Spa#1478';
                setUsername(username.text);
                setPassword(password.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CurvePage()));
              });
            } else {
              print("wrong username or password");
            }
            
          },
          child: Text("Login"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 20, 50, 20)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
        ),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  CurvePage()));
          },
          child: Text("เข้าสู่ระบบโดยไม่มีบัญชี"),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 20, 50, 20)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
        ),

        // SizedBox(height: 30),
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