import 'package:flutter/material.dart';

class aboutUsPage extends StatefulWidget {
  //const ContactPage({ Key? key }) : super(key: key);

  @override
  _aboutUsPageState createState() => _aboutUsPageState();
}
class _aboutUsPageState extends State<aboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Text ("Naphawan Chaichuen"),
              Text ("StudentID : 63160243")
            ],
          ),
        )
      ],
     
    );
  }
}
