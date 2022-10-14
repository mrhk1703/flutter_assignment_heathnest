import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/EventWidget.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:flutter_assignment/Views/Feed/PollWidget.dart';
import 'package:flutter_assignment/Views/Feed/QuestionWidget.dart';
import 'package:flutter_assignment/Views/Feed/SimplePostWidget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class FeedTileWidget extends StatefulWidget {
  Feeds feed;
  FeedTileWidget({Key key, @required this.feed}) : super(key: key);

  @override
  _FeedTileWidgetState createState() => _FeedTileWidgetState();
}

class _FeedTileWidgetState extends State<FeedTileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetBuild;
    switch (widget.feed.feedSubtType) {
      case "poll":
        widgetBuild = PollWidget(feed: widget.feed);
        break;
      case "question":
        widgetBuild = QuestionWidget(feed: widget.feed);
        break;
      case "event":
        widgetBuild = EventWidget(feed: widget.feed);
        break;
      case "simplePost":
        widgetBuild = SimplePostWidget(feed: widget.feed);
        break;
      default:
    }
    return widgetBuild;
  }



}
