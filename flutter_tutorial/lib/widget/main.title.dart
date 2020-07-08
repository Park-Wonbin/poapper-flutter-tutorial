import 'package:flutter/cupertino.dart';

Widget MainTitle(String title) => Container(
  alignment: Alignment.centerLeft,
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  child: Text(
    title,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
);