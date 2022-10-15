import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_assignment/Components/Reaction.dart' as Reactionss;
class MemberResponseWidget extends StatelessWidget {
  final Feeds feed;
  Function refreshResponse;
  MemberResponseWidget(
      {Key key, @required this.feed, @required this.refreshResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String response;
    int likCount = 0;
    int commentsCounts = 0;
    String responseIcon = "Like.png";
    switch (feed.feedSubtType) {
      case "poll":
        if (feed.likes.contains(UserDetails.userId)) {
          response = "You and " +
              feed.likes.length.toString() +
              " others liked this poll";
        } else {
          response =
              feed.likes.length.toString() + " members liked this poll";
        }
        likCount = feed.likes.length;

        commentsCounts = feed.comments.length;
        if (feed.isLiked) {
          responseIcon = "375-thumbs-up-1.png";
        } else {
          responseIcon = "Like.png";
        }
        break;
      case "question":
        if (feed.likes.contains(UserDetails.userId)) {
          response = "You and " +
              feed.likes.length.toString() +
              " others have this questiion";
        } else {
          response = feed.likes.length.toString() +
              " members have this questiion";
        }
        likCount = feed.likes.length;
        commentsCounts = feed.comments.length;
        if (feed.isLiked) {
          responseIcon = "234-man-raising-hand-1.png";
        } else {
          responseIcon = "empty_question.png";
        }
        break;
      case "event":
        if (feed.likes.contains(UserDetails.userId)) {
          response = "You and " +
              feed.likes.length.toString() +
              " others likes this event";
        } else {
          response =
              feed.likes.length.toString() + " members likes this event";
        }
        likCount = feed.likes.length;
        commentsCounts = feed.comments.length;
        if (feed.isLiked) {
          responseIcon = "375-thumbs-up-1.png";
        } else {
          responseIcon = "Like.png";
        }
        break;
      case "simplePost":
        if (feed.likes.contains(UserDetails.userId)) {
          response = "You and " +
              feed.likes.length.toString() +
              " others reacted to this post";
        } else {
          response = feed.likes.length.toString() +
              " members reacted to this post";
        }
        likCount = feed.likes.length;
        commentsCounts = feed.comments.length;
        if (feed.isLiked) {
          responseIcon = "375-thumbs-up-1.png";
        } else {
          responseIcon = "Like.png";
        }
        break;
      default:
    }
    return Container(
      color: MyColors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: MyColors.extraLightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 24,
                  child: Stack(
                    children: [
                      Positioned(
                          height: 24,
                          width: 24,
                          right: 0,
                          child: Image.asset(
                            "assets/01.png",
                            height: 24,
                          )),
                      Positioned(
                          height: 24,
                          width: 24,
                          right: 12,
                          child: Image.asset(
                            "assets/ImageMask.png",
                            height: 24,
                          )),
                      Positioned(
                          height: 24,
                          width: 24,
                          right: 24,
                          child: Image.asset(
                            "assets/01.png",
                            height: 24,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  child: Text(response,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .apply(color: MyColors.grey, fontSizeFactor: 0.65)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: MyColors.extraLightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               feed.feedSubtType == "question"? InkWell(
                  onTap: () {
                    
                      refreshResponse();
                    
                  },
                  child: Row(
                    children: [
                      
                      Image.asset("assets/" + responseIcon),
                      SizedBox(
                        width: 6,
                      ),
                      Text(likCount.toString(),
                          style: Theme.of(context).textTheme.headline6.apply(
                              fontWeightDelta: 30,
                              color: MyColors.grey,
                              fontSizeFactor: 0.7))
                    ],
                  ),
                ):
                Row(
                  children: [
                    Builder(
              builder: (ctx) {
                return ReactionButton<String>(
                onReactionChanged: (String value) {
                 refreshResponse();
                },
                reactions: Reactionss.userReactions,
                initialReaction: Reaction<String>(
                  value: null,
                  icon: Image.asset("assets/" + responseIcon),
                ),
                boxColor: MyColors.white,
                boxRadius: 10,
                boxDuration: Duration(milliseconds: 200),
                itemScaleDuration: const Duration(milliseconds: 200),
                );
              },
            ),
                    
                    SizedBox(
                      width: 6,
                    ),
                    Text(likCount.toString(),
                        style: Theme.of(context).textTheme.headline6.apply(
                            fontWeightDelta: 30,
                            color: MyColors.grey,
                            fontSizeFactor: 0.7))
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/comment-lines.png"),
                    SizedBox(
                      width: 6,
                    ),
                    Text(commentsCounts.toString(),
                        style: Theme.of(context).textTheme.headline6.apply(
                            fontWeightDelta: 30,
                            color: MyColors.grey,
                            fontSizeFactor: 0.7))
                  ],
                ),
                Image.asset("assets/bookmark-full.png"),
                InkWell(
                  onTap: (){
                    showMoreOptions(context);
                  },
                  child: Image.asset("assets/share-alt.png")),
              ],
            ),
          )
        ],
      ),
    );
  }


  showMoreOptions(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, // Also default
        builder: (context) => Container(
              height: 320,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      height: 4,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: MyColors.verLightGrey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text("Share Post",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(
                                    fontWeightDelta: 30,
                                    color: MyColors.darkgrey,
                                    fontSizeFactor: 0.75))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/Icons.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Send as a private message",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(
                                    fontWeightDelta: 0,
                                    color: MyColors.darkgrey,
                                    fontSizeFactor: 0.75))
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/Icons(6).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share as a post",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(
                                    fontWeightDelta: 0,
                                    color: MyColors.darkgrey,
                                    fontSizeFactor: 0.75))
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/share-fb.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share on Facebook",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(
                                    fontWeightDelta: 0,
                                    color: MyColors.darkgrey,
                                    fontSizeFactor: 0.75))
                      ],
                    ),
                  ), Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/Icons(1).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Share on WhatsApp",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .apply(
                                    fontWeightDelta: 0,
                                    color: MyColors.darkgrey,
                                    fontSizeFactor: 0.75))
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
