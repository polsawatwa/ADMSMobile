import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  //const ContactPage({ Key? key }) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}
class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 16, top: 16),
          child: Text(
            "เกี่ยวกับเรา",
            style: TextStyle(fontSize: 25, fontFamily: 'Prompt'),
          ),
        ),
      ],
    );
  }
}
