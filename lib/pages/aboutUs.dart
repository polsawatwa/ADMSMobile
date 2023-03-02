import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
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
          padding: EdgeInsets.only(left: 16, top: 9),
          child: Text(
            "เกี่ยวกับเรา",
            style: TextStyle(fontSize: 25, fontFamily: 'Prompt'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(1.0),
                child: Image.network(
                  'https://img.freepik.com/free-photo/landmark-pagoda-doi-inthanon-national-park-chiang-mai-thailand_335224-779.jpg?w=1060&t=st=1677748491~exp=1677749091~hmac=43a293e6df1690c4723539b4a117e7f50f9567da7bbf91c7a08bde1217cd3fe3',
                  width: 450,
                  height: 370,
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1.0),
                child: Column(
                  children: [
                    Text(
                      'ระบบจัดการคลังข้อมูลสถาปัตยกรรม',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                      ),
                    ),
                    Text(
                      '✦เป็นส่วนหนึ่งในการอนุรักษ์ข้อมูลทางวัฒนธรรมและความหลากหลายใน\nท้องถิ่นให้อยู่ได้อย่างยั่งยืน\n\n✦เป็นซอฟต์แวร์แพลตฟอร์มสำหรับบริหารจัดการข้อมูลวัฒนธรรมและ\nความหลากหลายทางชีวภาพ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
