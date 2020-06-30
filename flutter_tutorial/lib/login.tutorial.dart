import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthRepository>(context).authState;

    return authState == AuthState.UnAuthenticated ? LoginPage() : MainPage();
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('로그인'),
          onPressed: () {
            Provider.of<AuthRepository>(context, listen: false).setState(AuthState.Authenticated);
          },
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('로그아웃'),
          onPressed: () {
            Provider.of<AuthRepository>(context, listen: false).setState(AuthState.UnAuthenticated);
          },
        ),
      ),
    );  }
}