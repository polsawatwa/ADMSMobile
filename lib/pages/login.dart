import 'package:flutter/material.dart';
import 'home.dart';
import 'headfoot.dart';
import 'welcome.dart';
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
        Image.network(
          'https://cdn-icons-png.flaticon.com/512/2170/2170153.png',
          height: 300,
          width: 300,
        ),
        
    
        SizedBox(height: 30),
        TextField(
            controller: username,
            decoration: InputDecoration(
               prefixIcon: Icon(Icons.account_circle),
                labelText: 'Username', border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),))),
        SizedBox(height: 15),
        TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
         prefixIcon: Icon(Icons.key),
                labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),))),
        SizedBox(height: 10),
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
               ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong username or password.'),
          backgroundColor: Colors.red,
        ),
      );
            }
            
          },
          child: Text('เข้าสู่ระบบ', style: TextStyle(fontFamily: 'Prompt')),
          style: ButtonStyle(
             fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(50, 20, 50, 20)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
        ),
         SizedBox(height: 15),
       ElevatedButton(
  onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  },
  child: Text(
    'ย้อนกลับ',
    style: TextStyle(
      fontFamily: 'Prompt',
      fontSize: 20,
    ),
  ),
  style: ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(
      Size(200, 50),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    side: MaterialStateProperty.all<BorderSide>(
      BorderSide(
        width: 2,
        color: Color.fromARGB(255, 96, 125, 139),
      ),
    ),
    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
    padding: MaterialStateProperty.all(
      EdgeInsets.fromLTRB(50, 20, 50, 20),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 20,
      ),
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