import 'dart:io';
import 'dart:math';
import 'add.dart';
import 'edit.dart';
import 'delete.dart';
import 'detail.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum PopupItem { update, delete }

enum ItemState { create, update, delete }

class collectionPage extends StatefulWidget {
  const collectionPage({super.key});

  @override
  State<collectionPage> createState() => _collectionPageState();
}

class _collectionPageState extends State<collectionPage> {
  late dynamic numbersList;
  bool userType = true;
  bool deleteNotification = false;
  bool createNotification = false;
  bool updateNotification = false;
  List itemList = [];

  /// Get Data
  Future getData() async {
    final url = Uri.parse('http://localhost:8000/api/all-collection/');
    final response = await http.get(url);
    final result = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception("Error Can not fetch data !!!");
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  /// Rebuild Widget
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  /// Refresh data
  Future<void> _pullRefresh() async {
    List<String> freshNumbers = await NumberGenerator().slowNumbers();
    setState(() {
      numbersList = freshNumbers;
    });
  }

  /// Set alert state
  Future<void> setAlertTimeOut(ItemState itemState) async {
    switch (itemState) {
      case ItemState.delete:
        setState(() {
          deleteNotification = true;
        });
        await Future.delayed(const Duration(milliseconds: 5000), () {
          setState(() {
            deleteNotification = false;
          });
        });
        break;
      case ItemState.create:
        setState(() {
          createNotification = true;
        });
        await Future.delayed(const Duration(milliseconds: 5000), () {
          setState(() {
            createNotification = false;
          });
        });
        break;
      case ItemState.update:
        setState(() {
          updateNotification = true;
        });
        await Future.delayed(const Duration(milliseconds: 5000), () {
          setState(() {
            updateNotification = false;
          });
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Data Lists"),
      // ),
      floatingActionButton: userType ? FloatingActionButton(
        onPressed: () async {
          final reload = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
          if (reload == null) return;
          if (reload) {
            _pullRefresh();
            setAlertTimeOut(ItemState.create);
          }
        },
        child: const Icon(
          Icons.add,
          color: Color(0xffffffff),
        ),
      ): null,
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _pullRefresh,
            child: FutureBuilder(
              builder: (context, AsyncSnapshot? snapshot) {
                if (snapshot?.data == null) {
                  return Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return collectionData(
                      snapshot?.data[index]["id"],
                      snapshot?.data[index]["title"],
                      snapshot?.data[index]["sub_title"],
                      snapshot?.data[index]["image_url"],
                      snapshot?.data[index]["detail"],
                    );
                  },
                  itemCount: snapshot?.data?.length ?? 0,
                );
              },
              future: getData(),
            ),
          ),
          (deleteNotification)
              ? notification("Deleting 1 item.")
              : const SizedBox(height: 0),
          (updateNotification)
              ? notification("Updating 1 item.")
              : const SizedBox(height: 0),
          (createNotification)
              ? notification("Adding 1 item.")
              : const SizedBox(height: 0),
        ],
      ),
    );
  }

  /// ListTile Data
  Widget collectionData(int id, String title, String sub_title, String image_url, String detail) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(id: id),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                '${image_url}',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(
                title,
                maxLines: 1,
              ),
              subtitle: Text(
                sub_title,
                maxLines: 2,
              ),
              trailing: userType ? popupMenu(id, title, sub_title, image_url, detail) : null,
            ),
          ],
        ),
      ),
    );
  }

  /// Button Menu
  // Widget buttonMenu(
  //     int id, String title, String sub_title, String image_url, String detail) {
  //   return Wrap(
  //     spacing: 0, // space between two icons
  //     children: <Widget>[
  //       IconButton(
  //         onPressed: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) =>
  //                       UpdatePage(id, title, sub_title, image_url, detail)));
  //         },
  //         icon: const Icon(Icons.more_vert),
  //       ),
  //       IconButton(
  //         onPressed: () {
  //           // Navigator.push(context, MaterialPageRoute(builder: (context) => DPage(id)));
  //         },
  //         icon: const Icon(Icons.delete),
  //       ),
  //     ],
  //   );
  // }

  /// Popup Menu
  Widget popupMenu(
      int id, String title, String sub_title, String image_url, String detail) {
    return PopupMenuButton<PopupItem>(
      tooltip: "",
      onSelected: (PopupItem item) async {
        switch (item) {
          case PopupItem.update:
            final reload = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        UpdatePage(id, title, sub_title, image_url, detail)));
                        _pullRefresh();
            if (reload == null) return;
            if (reload) {
              _pullRefresh();
              setAlertTimeOut(ItemState.update);
            }
            break;
          case PopupItem.delete:
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Text(
                  'Delete "$title"',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await DeletePage().deleteCollection(id).then((value) {
                          _pullRefresh();
                          setAlertTimeOut(ItemState.delete);
                          Navigator.pop(context, 'OK');
                        });
                      } catch (e) {
                        setState(() {
                          deleteNotification = false;
                        });
                        Navigator.pop(context, 'OK');
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<PopupItem>>[
        const PopupMenuItem<PopupItem>(
          value: PopupItem.update,
          child: Text('Edit'),
        ),
        const PopupMenuItem<PopupItem>(
          value: PopupItem.delete,
          child: Text('Delete'),
        ),
      ],
    );
  }

  /// Notification
  Widget notification(String text) {
    return Positioned(
      bottom: 15,
      left: 15,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xff333333),
          ),
          padding: const EdgeInsets.only(top: 8, bottom: 7, left: 11),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}

/// Generate number
class NumberGenerator {
  Future<List<String>> slowNumbers() async {
    return Future.delayed(
      const Duration(milliseconds: 1),
      () => numbers,
    );
  }

  List<String> get numbers => List.generate(5, (index) => number);

  String get number => Random().nextInt(99999).toString();
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String image_url;
  final String detail;

  DetailScreen(
      {required this.title, required this.image_url, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              image_url,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              detail,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
