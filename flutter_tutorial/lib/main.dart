import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api.tutorial.dart';
import 'package:flutter_tutorial/layout.tutorial.dart';
import 'package:flutter_tutorial/login.tutorial.dart';
import 'package:flutter_tutorial/retrofit.tutorial.dart';
import 'package:flutter_tutorial/route.tutorial.dart';
import 'package:flutter_tutorial/screen/login.page.dart';
import 'package:flutter_tutorial/screen/main.page.dart';
import 'package:flutter_tutorial/sliver.tutorial.dart';
import 'package:provider/provider.dart';

import 'list.tutorial.dart';

void main() {
  runApp(MultiProvider(
    child: MyApp(),
    providers: [ChangeNotifierProvider.value(value: AuthRepository()), Provider<RestClient>.value(value: RestClient.create())],
  ));
}

enum AuthState {
  Authenticated, UnAuthenticated,
}

class AuthRepository with ChangeNotifier{
  AuthState authState = AuthState.UnAuthenticated;

  setState(AuthState state) {
    authState = state;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => RetrofitTutorial(),
        SecondRoute.routeName: (context) => SecondRoute(),
      },
      /* Lecture 01 - LayoutTutorial()
       * Lecture 02 - FirstRoute(), ListTutorial()
       * Lecture 03 - SliverTutorial(), RootPage()
       */
    );
  }
}