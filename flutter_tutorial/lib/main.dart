import 'package:flutter/material.dart';
import 'package:flutter_tutorial/layout.tutorial.dart';
import 'package:flutter_tutorial/route.tutorial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: FirstRoute()
      /* Lecture 01 - LayoutTutorial()
       * Lecture 02 - FirstRoute()
      L*/
    );
  }
}