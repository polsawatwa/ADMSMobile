import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override

  /// Get Data
  Future getData() async {
    final url = Uri.parse(
        'http://dekdee2.informatics.buu.ac.th:9090/api/all-collection/');
    final response = await http.get(url);
    final result = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception("Error Can not fetch data !!!");
    }
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final image_url = snapshot.data[0]['image_url'];
                        if (image_url != null) {
                          return Image.network(
                            image_url,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          );
                        }
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'คอลเลกชันยอดนิยม',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        FutureBuilder(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final image_url = snapshot.data[1]['image_url'];
                              if (image_url != null) {
                                return Image.network(
                                  image_url,
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit.cover,
                                );
                              }
                            }
                            return SizedBox.shrink();
                          },
                        ),
                        SizedBox(width: 16.0),
                        FutureBuilder(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final title = snapshot.data[1]['title'];
                              if (title != null) {
                                return Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Prompt',
                                  ),
                                );
                              }
                            }
                            return SizedBox.shrink();
                          },
                        ),
                        SizedBox(width: 16.0),
                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         'title',
                        //         style: TextStyle(
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.bold,
                        //           fontFamily: 'Prompt',
                        //         ),
                        //       ),
                        //       SizedBox(height: 5.0),
                        //       Text(
                        //         'sub',
                        //         style: TextStyle(
                        //           fontSize: 14,
                        //           fontFamily: 'Prompt',
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'คอลเลกชันใหม่',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Prompt',
                  ),
                ),
                FutureBuilder(
                  future: getData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
// Card 1
                            Expanded(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.network(
                                      data[0]['image_url'],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[0]['title'] ?? "",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Prompt',
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            data[0]['subtitle'] ?? "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Prompt',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
// Card 2
                            SizedBox(width: 16),
                            Expanded(
                              child: Card(
                                child: Column(
                                  children: [
                                    Image.network(
                                      data[1]['image_url'],
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[1]['title'] ?? "",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Prompt',
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            data[1]['subtitle'] ?? "",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Prompt',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
