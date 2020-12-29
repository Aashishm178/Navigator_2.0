import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const String id = 'First';
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.yellow,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.clear,
          color: Colors.white,
        ),
      ),
    );
  }
}
