import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuestionWidget extends StatelessWidget {
  final Feeds feed;
  QuestionWidget({Key key, @required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: MyColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTopWidget(feed: feed),
          feed.question.question != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(feed.question.question,
                      style: Theme.of(context).textTheme.headline6.apply(
                          fontWeightDelta: 30,
                          color: MyColors.darkgrey,
                          fontSizeFactor: 0.8)),
                )
              : Container(),
          feed.question.message != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text(feed.question.message,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .apply(color: MyColors.grey, fontSizeFactor: 0.75)),
                )
              : Container(),
          feed.question.location != null
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/map-marker-alt.png"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(feed.question.location,
                          style: Theme.of(context).textTheme.headline6.apply(
                              color: MyColors.themeColor,
                              fontSizeFactor: 0.65)),
                    ],
                  ),
                )
              : Container(),
          
              
        ],
      ),
    );
  }

}
