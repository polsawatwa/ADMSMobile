import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController title = TextEditingController();
  TextEditingController sub_title = TextEditingController();
  TextEditingController image_url = TextEditingController();
  TextEditingController detail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Add Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: title,
              decoration: InputDecoration(
                labelText: 'ชื่อสถาปัตยกรรม',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: sub_title,
              decoration: InputDecoration(
                labelText: 'บทบรรยายนำชม',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: image_url,
              decoration: InputDecoration(
                labelText: 'ลิงก์รูปภาพ',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              minLines: 4,
              maxLines: 8,
              controller: detail,
              decoration: InputDecoration(
                labelText: 'รายละเอียด', border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  print('-----------');
                  print('title: ${title.text}');
                  print('sub_title: ${sub_title.text}');
                  print('image_url: ${image_url.text}');
                  print('detail: ${detail.text}');
                  print('-----------');
                  postCollection();
                  print('-----------');
                  setState(() {
                    title.clear();
                    sub_title.clear();
                    image_url.clear();
                    detail.clear();
                  });
                  Navigator.pop(context);
                }, 
                child: Text("เพิ่มรายการ"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent[100]),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.fromLTRB(50, 20, 50, 20)
                  ),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

    Future postCollection() async {
    //http://10.80.74.246:8080/api/v3/user
    var url = Uri.parse('http://dekdee2.informatics.buu.ac.th:9090/api/add-collection/');
    //ประเภทของ Data ที่เราจะส่งไป เป็นแบบ json
    Map<String, String> header = {"Content-type": "application/json"};
    //Data ที่จะส่ง
    String jsondata = '{"title":"${title.text}", "sub_title":"${sub_title.text}", "image_url":"${image_url.text}", "detail":"${detail.text}"}';

    //เป็นการ Response ค่าแบบ POST
    var response = await http.post(url, headers: header , body:jsondata );
    print('------result-------');
    print(response.statusCode);
  }
}
