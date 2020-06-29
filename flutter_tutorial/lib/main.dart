import 'package:flutter/material.dart';
import 'package:flutter_tutorial/layout.tutorial.dart';
import 'package:flutter_tutorial/route.tutorial.dart';

import 'list.tutorial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      initialRoute: '/',
      routes: {
        '/': (context) => ListTutorial(),
        SecondRoute.routeName: (context) => SecondRoute(),
      },
      /* Lecture 01 - LayoutTutorial()
       * Lecture 02 - FirstRoute(), ListTutorial()
      L*/
    );
  }
}