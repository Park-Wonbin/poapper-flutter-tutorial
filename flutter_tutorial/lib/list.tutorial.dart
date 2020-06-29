import 'package:flutter/material.dart';

class ListTutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';
    
    List<ListItem> items = List<ListItem>.generate(
      50,
      (i) => i % 6 == 0
      ? HeadingItem("Heading $i")
          : MessageItem("Sender $i", "Message body $i")
      );

    // Sample3
    Widget customListView = ListView.builder(
      // Let the ListView know how many items it needs to build.
      itemCount: items.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      // ignore: missing_return
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
      },
    );

    // Sample1
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

    // Sample2
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
      body: customListView,
    );
  }
}

// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
final String heading;

HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
final String sender;
final String body;

MessageItem(this.sender, this.body);
}