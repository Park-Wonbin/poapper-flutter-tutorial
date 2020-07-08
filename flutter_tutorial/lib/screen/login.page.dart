import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/poapper.login.button.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Widget title = Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              "images/logo.png",
              width: size.width * 0.6,
              height: size.width * 0.6,
              fit: BoxFit.scaleDown,
            ),
            margin: EdgeInsets.all(30),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              "인포스택",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff4c5c75),
              ),
            ),
          ),
          Text(
            "포스텍 종합 정보 시스템",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Color(0xff4c5c75),
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.75,
            decoration: BoxDecoration(
              color: Color(0xffdedecd),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: title,
          ),
          Spacer(),
          PoApperLoginButton(size),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text("ⓒ 2020. PoApper all rights reserved."),
          )
        ],
      ),
    );
  }
}