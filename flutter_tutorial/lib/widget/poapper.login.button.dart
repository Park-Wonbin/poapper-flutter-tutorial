import 'package:flutter/material.dart';

Widget PoApperLoginButton(Size size) => Container(
  width: size.width,
  height: 60,
  margin: EdgeInsets.symmetric(
    horizontal: 20,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Color(0xff666666).withOpacity(.11),
        offset: Offset(0, 15),
        blurRadius: 30,
      )
    ]
  ),
  child: Material(
    borderRadius: BorderRadius.circular(30),
    color: Colors.white,
    child: InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {

      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Image.asset(
              "images/poapper.icon.png",
              width: 35,
              height: 35,
            ),
          ),
          Container(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "포애퍼 계정으로 시작하기",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  ),
);