import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  var userId, theme;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  userId = prefs.getString('id');

  theme = prefs.getString('theme');

  print(userId);
  if (theme == null || theme == "Light") {
    await MyColors.lightColor();
    prefs.setString("theme", "Light");
  } else {
    await MyColors.darkColor();
  }
 
  runApp(MyApp(
      userId: userId));
}

class MyApp extends StatelessWidget {
  final String userId;
  MyApp(
      {this.userId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthNest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        backgroundColor: Colors.transparent,
        primaryColorDark: MyColors.themeColor,
        primaryColor: MyColors.themeColor,
        focusColor: MyColors.themeColor,
        fontFamily: 'Shippori',
        dividerColor: Colors.transparent,
      ),
      builder: (context, child) {
        return MediaQuery(
          child: child,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      home: SplashScreen(
          userId: userId),
    );
  }
}
