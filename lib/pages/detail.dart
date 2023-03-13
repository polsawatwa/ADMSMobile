import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? title;
  String? subtitle;
  String? imageUrl;
  String? detail;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('http://127.0.0.1:8000/api/all-todolist/${widget.id}'));
      final data = jsonDecode(response.body);
      setState(() {
        title = data['title'];
        subtitle = data['sub_title'];
        imageUrl = data['image_url'];
        detail = data['detail'];
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (title == null ||
        subtitle == null ||
        imageUrl == null ||
        detail == null) {
      // Show a loading indicator while the data is being fetched
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // Once the data is available, show the details page
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            SizedBox(width: 8),
            Text(title!,style: TextStyle(fontSize: 20, fontFamily: 'Prompt'),),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl!),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 8),
                Text(
                  detail!,
                  style: Theme.of(context).textTheme.bodyText1,
                  // textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
