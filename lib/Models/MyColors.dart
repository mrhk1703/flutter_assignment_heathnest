import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyColors {
  MyColors._();
  static String theme;
  static Color themeColor;
  static Color greenAsscent;
  static Color darkgrey;
  static Color grey;
  static Color lightGrey;
  static Color verLightGrey;
  static Color extraLightGrey;
  static Color blue;
  static Color red;
  static Color darkred;
  static Color darkyellow;
  static Color white;
  static Color black;
  static Color yellow;
  static Color darkBlue;
  static Color lightblue;
  static Color pictonBlue;

  static Future<void> lightColor() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    theme = "Light";
    preferences.setString("theme", theme);

    greenAsscent = Color(0xFF1DA237);
    darkgrey = Color(0xFF616161);
    grey = Color(0xFF7E7E7E);
    lightGrey = Color(0xFFAAAAAA);
    verLightGrey = Color(0xFFC1C1C1);
    extraLightGrey = Color(0xFFEBECF0);
    blue = Color(0xFF1E90FF);
    red = Color(0xFFee0f38);
    pictonBlue = Color(0xFF5499C7);
    darkred = Color(0xFFA02422);
    darkyellow = Color(0xFFFF8C00);
    white = Color(0xFFFFFFFF);

    black = Color(0xFF000000);
    yellow = Colors.yellow;
    darkBlue = Color(0xFF22388D);
    themeColor = Color(0xFF00A981);

    lightblue = Color(0xFF4FC3F7);
  }

  static Future<void> darkColor() async {
    theme = "Dark";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("theme", theme);
    greenAsscent = Color(0xFF1DA237);
    darkgrey = Color(0xFFEBECF0);
    grey = Color(0xFFC1C1C1);
    lightGrey = Color(0xFFAAAAAA);
    verLightGrey = Color(0xFF7E7E7E);
    extraLightGrey = Color(0xFF222222);
    blue = Color(0xFF1E90FF);
    red = Color(0xFFA02422);
    darkred = Color(0xFFD8392B);
    pictonBlue = Color(0xFF5499C7);
    themeColor = Color(0xFF00A981);

    darkyellow = Color(0xFFFF8C00);
    white = Color(0xFF2C2C2B);
    black = Color(0xFFFFFFFF);
    yellow = Colors.yellow;
    darkBlue = Color(0xFF4FC3F7);
    lightblue = Color(0xFF22388D);
  }
}
