import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router/pages/SecondScreen.dart';
import 'package:flutter_router/route/RouterProvider.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  static const String id = '/';
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Provider.of<RouterProvider>(context, listen: false)
              .addPage(SecondScreen.id);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
