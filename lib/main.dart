// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TheApp());
}

class TheApp extends StatelessWidget {
  void getReq(int entry) {
    var res = http.get(Uri.parse(
        'http://localhost:5000/cs-322-0/us-central1/helloWorld?number=${entry}'));
    res.then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    int entrynum = 1;

    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 147, 218, 229),
        body: Column(
          // mainAxisAlignment: ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.lightBlue,
            ),
            GestureDetector(
              onTap: () => getReq(entrynum++),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.deepPurple,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
