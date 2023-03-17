import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DeletePage {
  // const DeletePage({super.key});
  Future deleteCollection(int v1) async {
    var url = Uri.http('dekdee2.informatics.buu.ac.th:9090', '/api/delete-collection/$v1');
    Map<String, String> header = {"Content-type": "application/json"};
    var response = await http.delete(url, headers: header);
    print('------result-------');
    print(response.statusCode);
  }
}
