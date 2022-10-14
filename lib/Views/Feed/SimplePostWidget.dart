import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SimplePostWidget extends StatelessWidget {
  final Feeds feed;
  SimplePostWidget({Key key, @required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String hashTags;
    feed.simplePost.hashTags.forEach((element) {
      if (hashTags != null) {
        hashTags = hashTags + "#" + element + "  ";
      } else {
        hashTags = "#" + element + "  ";
      }
    });
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: MyColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTopWidget(feed: feed),
          feed.simplePost.description != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(feed.simplePost.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .apply(color: MyColors.grey, fontSizeFactor: 0.75)),
                )
              : Container(),
          hashTags != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(hashTags,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6.apply(
                          color: MyColors.pictonBlue, fontSizeFactor: 0.75)),
                )
              : Container(),
          feed.simplePost.image != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Image.asset("assets/" + feed.simplePost.image),
                )
              : Container(),
          feed.simplePost.location != null
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
                      Text(feed.simplePost.location,
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
