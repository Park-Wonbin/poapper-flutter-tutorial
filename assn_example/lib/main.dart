import 'package:assn/create.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:assn/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    child: CupertinoApp(
      home: MyApp(),
    ),
    providers: [Provider<RestClient>.value(value: RestClient.create())],
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final passwordCtl = TextEditingController();

    return CupertinoPageScaffold(
      child: FutureBuilder<List<Feed>>(
        future: Provider.of<RestClient>(context, listen: false).getFeeds(),
        builder: (BuildContext context, AsyncSnapshot<List<Feed>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text("Error", style: TextStyle(color: Colors.red),),
                ),
              );
            }
            final feeds = snapshot.data;
            return CustomScrollView(
              slivers: [
                CupertinoSliverNavigationBar(
                  trailing: CupertinoButton(
                    padding: EdgeInsets.all(0),
                    child: Icon(CupertinoIcons.pencil),
                    onPressed: () {
                      movePage();
                    },
                  ),
                  largeTitle: Text("Assn 예시"),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
                      return GestureDetector(
                        onLongPress: () {
                          passwordCtl.text = "";
                          showCupertinoDialog(
                              context: context, builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                                title: Text("게시글 삭제하기"),
                                content: Column(
                                  children: [
                                    Text("글을 지우려면 설정한 암호를 입력하세요."),
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: CupertinoTextField(
                                        controller: passwordCtl,
                                        placeholder: "Password",
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: Text(
                                      "삭제", style: TextStyle(color: Colors.red),),
                                    onPressed: () {
                                      Provider.of<RestClient>(
                                          context, listen: false).deleteFeed(
                                          feeds[index].id,
                                          DeleteFeed(password: passwordCtl.text))
                                          .then((value) {
                                        setState(() => {});
                                        Navigator.of(context).pop();
                                      })
                                          .catchError((Object obj) {
                                        showCupertinoDialog(
                                            context: context, builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text("암호 잘못됨"),
                                              content: Text("암호를 확인해주세요!"),
                                              actions: [
                                                CupertinoDialogAction(
                                                  isDefaultAction: true,
                                                  child: Text("확인"),
                                                  onPressed: () =>
                                                      Navigator.of(context).pop(),
                                                ),
                                              ],
                                            ));
                                        // non-200 error goes here.
                                        switch (obj.runtimeType) {
                                          case DioError:
                                          // Here's the sample to get the failed response error code and message
                                            final res = (obj as DioError).response;
                                            print("Got error : ${res
                                                .statusCode} -> ${res
                                                .statusMessage}");
                                            break;
                                          default:
                                        }
                                      });
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("취소"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff666666).withOpacity(.11),
                                  offset: Offset(0, 15),
                                  blurRadius: 30,
                                )
                              ]
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(feeds[index].title, style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ), textAlign: TextAlign.left,),
                                Text(feeds[index].content, style: TextStyle(
                                  fontSize: 15,
                                ),)
                              ]
                          ),
                        ),
                      );
                    },
                      childCount: feeds.length,
                    )
                )
              ],
            );
          } else {
            return Container(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  void movePage() async {
    await Navigator.push(context, CupertinoPageRoute(builder: (context) => CreatePage()));
    setState(() => {});
  }
}