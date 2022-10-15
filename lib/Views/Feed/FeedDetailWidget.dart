import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Comments.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/CommentWidget.dart';
import 'package:flutter_assignment/Views/Feed/FeedTileWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';

class FeedDetailWidget extends StatefulWidget {
  Feeds feed;
  Function refreshReaction;
  FeedDetailWidget(
      {Key key, @required this.feed, @required this.refreshReaction})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FeedDetailWidgetState();
  }
}

class FeedDetailWidgetState extends State<FeedDetailWidget> {
  @override
  void initState() {
    super.initState();
  }

  String addingFav;
  @override
  Widget build(BuildContext context) {
    List<Widget> lstCommentWidget = [];
    widget.feed.comments.forEach((element) {
      lstCommentWidget.add(CommentWidget(feed: widget.feed, comments: element));
    });
    return Scaffold(
        backgroundColor: MyColors.extraLightGrey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: MyColors.white,
          elevation: 0.0,
          title: Text(
            widget.feed.feedSubtType.toUpperCase(),
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
            FeedTileWidget(feed: widget.feed),
            MemberResponseWidget(
                feed: widget.feed,
                refreshResponse: () {
                  setState(() {
                    widget.refreshReaction();
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                color: MyColors.white,
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  children: lstCommentWidget,
                ),
              ),
            )
          ],
        ));
  }
}
