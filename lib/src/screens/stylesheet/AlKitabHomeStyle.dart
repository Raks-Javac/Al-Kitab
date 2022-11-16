import 'package:flutter/material.dart';

Color menuColor = Color(0xFFE5E5E5);
Color quoteReadColor = Color(0xFF959595);
Color drawerAlignStyle = Color(0xFFBE96FF);
var lastReadTextStyle = TextStyle(
  fontSize: 25,
  fontFamily: "PRegular",
);
var customLastRead = TextStyle(
  fontSize: 15,
  fontFamily: "PRegular",
  color: quoteReadColor,
);
var arabicHomeColor = Color(0xFFBE96FF);
var homeAppBarTextStyle = TextStyle(fontSize: 27, fontFamily: "PBold");
TextStyle homeGreetingsTextStyle(Color? color) {
  return TextStyle(fontSize: 23, color: color, fontFamily: "PRegular");
}

var unSelectedTabStyle = TextStyle(
  color: Colors.white.withOpacity(0.6),
  fontSize: 13,
);
