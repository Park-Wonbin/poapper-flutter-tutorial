import 'package:flutter/material.dart';

class ListTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    Widget myGridView = GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline,
          ),
        );
      }),
    );

    Widget myListView = ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: myListView,
    );
  }

}