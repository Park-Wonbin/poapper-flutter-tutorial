import 'package:flutter/material.dart';

class SliverTutorial extends StatefulWidget {
  @override
  SliverTutorialState createState() => SliverTutorialState();
}

class SliverTutorialState extends State<SliverTutorial> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    void showSnackBar(String text) {
      scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
    }

    void showSnackBar2(String text) {
      scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
    }

    Widget customScrollView = CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 240.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
            centerTitle: true,
            background: Image(image: AssetImage('images/lake.jpg'), fit: BoxFit.cover),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            showSnackBar('hihi $index');
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            showSnackBar2('꾹 누름!');
                          });
                        },
                        child: Text('hihi $index')
                    )
                );
              },
              childCount: 30,
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