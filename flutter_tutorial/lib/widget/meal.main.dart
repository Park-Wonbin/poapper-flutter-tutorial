import 'package:flutter/material.dart';

import 'main.title.dart';

Widget MealMenu(Size size) => Container(
  alignment: Alignment.centerLeft,
  child: Column(
    children: [
      MainTitle('학식메뉴'),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              Container(child: MealBox('아침', 'images/delivery/delivery.love.png'), margin: EdgeInsets.only(left: 10),),
              MealBox('점심', 'images/delivery/delivery.love.png'),
              Container(child: MealBox('저녁', 'images/delivery/delivery.love.png'), margin: EdgeInsets.only(right: 10),),

            ],
          ),
        ),
      ),
    ]
  ),
);

Widget MealBox(String category, String imgPath) => Container(
  width: 260,
  height: 160,
  margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(15),
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
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Positioned(child: Image.asset(imgPath, width: 46, height: 46,), right: 0, bottom: 0,),
      Text(category, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
    ],
  ),
);