import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api.tutorial.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

/*class RetrofitTutorial extends StatefulWidget {
  @override
  RetrofitTutorialState createState() => RetrofitTutorialState();
}*/

class RetrofitTutorial extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final logger = Logger();

  @override
  Widget build(BuildContext context) {

    // client.getFeeds().then((value) => logger.i(value));

    void showSnackBar(String text) {
      scaffoldKey.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));
    }

    FutureBuilder _listFutureFeed(BuildContext context) {
      return FutureBuilder<List<Feed>>(
        future: Provider.of<RestClient>(context, listen: false).getFeeds(),
        builder: (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text("error"),
                ),
              );
            }
            final feeds = snapshot.data;
            return ListView.builder(
                itemCount: feeds.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () { showSnackBar(feeds[index].content); },
                    child: Card(
                      margin: EdgeInsets.all(20),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(feeds[index].title, style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text(feeds[index].content),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      );
    }

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text("Retrofit Sample"),
        ),
        body: _listFutureFeed(context),
      );
  }


}