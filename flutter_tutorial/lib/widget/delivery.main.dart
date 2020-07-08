import 'package:flutter/material.dart';

import 'main.title.dart';

Widget DeliveryMain(Size size) => Container(
  alignment: Alignment.centerLeft,
  child: Column(
    children: [
      MainTitle('배달업체'),
      SearchBar(size),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              Container(child: StoreBox('즐겨찾기', 'images/delivery/delivery.star.png'), margin: EdgeInsets.only(left: 10),),
              StoreBox('정식', 'images/delivery/delivery.bento.png'),
              StoreBox('야식', 'images/delivery/delivery.night.png'),
              StoreBox('분식', 'images/delivery/delivery.sausages.png'),
              StoreBox('중화요리', 'images/delivery/delivery.noodles.png'),
              StoreBox('족발&보쌈', 'images/delivery/delivery.beef.png'),
              StoreBox('피자', 'images/delivery/delivery.pizza.png'),
              StoreBox('치킨', 'images/delivery/delivery.chicken.png'),
              StoreBox('햄버거', 'images/delivery/delivery.hamburger.png'),
              Container(child: StoreBox('해산물', 'images/delivery/delivery.fish.png'), margin: EdgeInsets.only(right: 10),),

            ],
          ),
        ),
      ),
      MainTitle('복지시설'),
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              Container(child: StoreBox('지곡회관', 'images/delivery/delivery.love.png'), margin: EdgeInsets.only(left: 10),),
              StoreBox('학생회관', 'images/delivery/delivery.love.png'),
              Container(child: StoreBox('기타', 'images/delivery/delivery.love.png'), margin: EdgeInsets.only(right: 10),),

            ],
          ),
        ),
      ),
    ],
  ),
);

Widget SearchBar(Size size) => Container(
  width: size.width,
  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
  child: Row(
    children: [
      Expanded(
        child: Text('>_ 여기에 검색하기', style: TextStyle(
          color: Colors.grey
        ),),
      ),
      Icon(
        Icons.search,
        color: Colors.grey,
      )
    ],
  ),
);

Widget StoreBox(String category, String imgPath) => Container(
  width: 120,
  height: 120,
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