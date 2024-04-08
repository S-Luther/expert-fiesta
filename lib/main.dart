// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(TheApp());
}

class TextBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text;
    print("second $text (${text.characters.length})");
    var res = http.get(Uri.parse(
        'http://localhost:5000/cs-322-0/us-central1/helloWorld?number=${text}'));
    res.then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            print("first $value (${value.characters.length})");
          },
        ),
        TextField(
          controller: myController,
        ),
      ],
    );
  }
}

class changingBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _changingBoxState();
}

class _changingBoxState extends State<changingBox> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            ),
            child: Center(
                child: Text(
              _active ? "Active" : "Inactive",
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ))));
  }
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
              child: TextBox(),
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.lightBlue,
              child: changingBox(),
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
