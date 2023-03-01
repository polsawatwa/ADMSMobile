import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class collectionPage extends StatefulWidget {
  const collectionPage({super.key});

@override
  // ignore: library_private_types_in_public_api
  _collectionPageState createState() => _collectionPageState();
}

class _collectionPageState extends State<collectionPage> {
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "CARE BEAR SHOP",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Total price is xxx bath"),
            SizedBox(
              height: 10,
            ),
            Image.network(
              'https://www.creativefabrica.com/wp-content/uploads/2021/11/19/Bear-PNG-File-Cute-Clip-Art-Graphics-20422066-1.png',
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: quantity,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of Products',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: price,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price of Products',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = double.parse(quantity.text) * double.parse(price.text);
                });
              },
              child: Text("Calculate"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(206, 119, 119, 1)),
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30)),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(50,20,50,20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("$result"),

          ],
        ),
      ),
    );
  }
}