import 'package:flutter/material.dart';
import 'package:flutter_tutorial/constant/color.dart';
import 'package:flutter_tutorial/widget/delivery.main.dart';
import 'package:flutter_tutorial/widget/meal.main.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void showSnackBar(String text) {
      scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
    }

    Widget customScrollView = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xffffffff),
          pinned: true,
          expandedHeight: 150.0,
          actions: [
            IconButton(
              icon: Icon(Icons.add_circle),
              tooltip: 'Add new entry',
              onPressed: () {

              }
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: '포스텍 종합 정보 시스템\n', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10, color: postech_red)),
                    TextSpan(text: '인포스택', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ]
              ),
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: Column(
                      children: [
                        MealMenu(size),
                        DeliveryMain(size)
                      ],
                    ),
                  ),
              ]
            )
        )
      ],
    );


    return Scaffold(
      key: scaffoldKey,
      body: customScrollView,
    );
  }

}