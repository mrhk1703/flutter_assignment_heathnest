import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class EventWidget extends StatelessWidget {
  final Feeds feed;
  EventWidget({Key key, @required this.feed}) : super(key: key);

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
          feed.event.title != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                  child: Text(feed.event.title.toUpperCase(),
                      style: Theme.of(context).textTheme.headline6.apply(
                          fontWeightDelta: 30,
                          color: MyColors.darkgrey,
                          fontSizeFactor: 0.8)),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(feed.event.dateTime,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .apply(color: MyColors.darkgrey, fontSizeFactor: 0.65)),
          ),
          feed.event.location != null
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/location.png"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(feed.event.location.toUpperCase(),
                          style: Theme.of(context).textTheme.headline6.apply(
                              color: MyColors.lightGrey, fontSizeFactor: 0.65)),
                    ],
                  ),
                )
              : Container(),
          Container(
              color: MyColors.themeColor.withOpacity(0.1),
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Are you going?",
                          style: Theme.of(context).textTheme.headline6.apply(
                              color: MyColors.darkgrey,
                              fontWeightDelta: 30,
                              fontSizeFactor: 0.65)),
                      Row(
                        children: [
                          Image.asset(
                            "assets/people.png"
                          ),
                          SizedBox(width: 5,),
                          Text(
                              feed.event.interestedGoing.length.toString() +
                                  " People Going",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .apply(
                                      color: MyColors.darkgrey,
                                      fontSizeFactor: 0.55)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.3, color:MyColors.themeColor),
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child:Text("No",
                              style: Theme.of(context).textTheme.headline6.apply(
                                  color: MyColors.themeColor,
                                  fontSizeFactor: 0.65))
                      ),
                      SizedBox(width: 12,),
                      Container(
                    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.3, color:MyColors.themeColor),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child:Text("Yes",
                          style: Theme.of(context).textTheme.headline6.apply(
                              color: MyColors.themeColor,
                              fontSizeFactor: 0.65))
                  )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
