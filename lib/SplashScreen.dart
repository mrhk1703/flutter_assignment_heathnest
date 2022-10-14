import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Views/HomeNavigationBar.dart';
import 'package:flutter_assignment/Views/LoginWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  String userId;
  SplashScreen({Key key, @required this.userId}) : super(key: key);

  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  Future<void> navigationPage() async {
    if (widget.userId != null) {
      UserController.getUserById(widget.userId).then((value) {
        UserController.saveUserDetails(value[0]);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeNavigationBarWidget(index: 0)));
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginWidget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/Logo.png',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                
                Text("HealthNest",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6.apply(
                          fontSizeFactor: 1.2,
                          fontWeightDelta: 30,
                          color: MyColors.themeColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
