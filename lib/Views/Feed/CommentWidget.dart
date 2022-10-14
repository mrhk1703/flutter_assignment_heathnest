import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Comments.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';

class CommentWidget extends StatelessWidget {
  final Feeds feed;
  Comments comments;
  CommentWidget({Key key, @required this.feed, @required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Users>>(
        future: UserController.getUserById(feed.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/" + snapshot.data[0].profileImage),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 0.3, color: MyColors.verLightGrey)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 12, 4, 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                              snapshot.data[0].userName != null
                                                  ? snapshot.data[0].userName
                                                  : "Member Anonymous",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .apply(
                                                      color: MyColors.darkgrey,
                                                      fontWeightDelta: 10,
                                                      fontSizeFactor: 0.65)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      snapshot.data[0].userType != null
                                          ? (snapshot.data[0].userType
                                                      .toLowerCase() ==
                                                  "expert"
                                              ? Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 1, 4, 1),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: MyColors.themeColor
                                                          .withOpacity(0.12)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          "assets/Icon.png"),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                          snapshot
                                                              .data[0].userType
                                                              .toUpperCase(),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline6
                                                              .apply(
                                                                  fontWeightDelta:
                                                                      30,
                                                                  color: MyColors
                                                                      .themeColor,
                                                                  fontSizeFactor:
                                                                      0.55)),
                                                    ],
                                                  ),
                                                )
                                              : Text(snapshot.data[0].userType,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline6
                                                      .apply(
                                                          fontWeightDelta: 0,
                                                          color: MyColors
                                                              .themeColor,
                                                          fontSizeFactor:
                                                              0.55)))
                                          : Container(),
                                      SizedBox(height: 12),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        child: Text(comments.comment,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .apply(
                                                    fontWeightDelta: 0,
                                                    color: MyColors.darkgrey,
                                                    fontSizeFactor: 0.65)),
                                      ),
                                      comments.image != null
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              padding: EdgeInsets.only(top: 10),
                                              child: Image.asset(
                                                  "assets/" + comments.image),
                                            )
                                          : Container()
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 0, 0, 0),
                                          child: Icon(
                                            Icons.more_vert,
                                            color: MyColors.grey,
                                          )))
                                ],
                              ),
                            ),
                            Container(width: MediaQuery.of(context).size.width*0.78,
                            height: 0.5,
                            color:MyColors.verLightGrey
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width*0.78,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset("assets/arrow-up.png"),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(comments.upVotes.length.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .apply(
                                                    fontWeightDelta: 30,
                                                    color: MyColors.grey,
                                                    fontSizeFactor: 0.7))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Image.asset("assets/Vector.png"),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(comments.downVotes.length.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .apply(
                                                    fontWeightDelta: 30,
                                                    color: MyColors.grey,
                                                    fontSizeFactor: 0.7))
                                      ],
                                    ),
                                    Image.asset("assets/share-alt.png"),
                                     Text("Reply",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .apply(
                                                    fontWeightDelta: 30,

                                                    color: MyColors.themeColor,
                                                    fontSizeFactor: 0.7))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container();
        });
  }
}
