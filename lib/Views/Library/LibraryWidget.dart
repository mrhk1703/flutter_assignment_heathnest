import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Comments.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/CommentWidget.dart';
import 'package:flutter_assignment/Views/Feed/FeedTileWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';

class LibraryWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LibraryWidgetState();
  }
}

class LibraryWidgetState extends State<LibraryWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: MyColors.extraLightGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: MyColors.white,
          elevation: 0.0,
          title: Text(
           "Library",
            style: Theme.of(context).textTheme.headline6.apply(
                fontWeightDelta: 30,
                fontSizeFactor: 0.8,
                color: MyColors.black),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                padding: EdgeInsets.all(5),
                child: Image.asset("assets/arrow-left.png")),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          children: [
          ],
        ));
  }
}
