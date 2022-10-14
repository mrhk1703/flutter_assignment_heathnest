import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';

class FeedTopWidget extends StatelessWidget {
  final Feeds feed;
  FeedTopWidget({Key key, @required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(feed.feedType.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6.apply(
                      color: MyColors.lightGrey,
                      fontWeightDelta: 10,
                      fontSizeFactor: 0.65)),
              Text("1 Min",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .apply(color: MyColors.darkgrey, fontSizeFactor: 0.55)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder<List<Users>>(
              future: UserController.getUserById(feed.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage("assets/" +
                                        snapshot.data[0].profileImage),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        feed.subTitle != null
                                            ? feed.subTitle
                                            : "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .apply(
                                                color: MyColors.verLightGrey,
                                                fontSizeFactor: 0.65))
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
                                            padding:
                                                EdgeInsets.fromLTRB(4, 1, 4, 1),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: MyColors.themeColor
                                                    .withOpacity(0.12)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset("assets/Icon.png"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                    snapshot.data[0].userType
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        .apply(
                                                            fontWeightDelta: 30,
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
                                                    color: MyColors.themeColor,
                                                    fontSizeFactor: 0.55)))
                                    : Container()
                              ],
                            )
                          ],
                        ),
                        InkWell(
                            onTap: () {
                              showMoreOptions(context);
                            },
                            child: Container(
                                padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Icon(
                                  Icons.more_vert,
                                  color: MyColors.grey,
                                )))
                      ],
                    ),
                  );
                }
                return Container();
              })
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
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/eye.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hide <Post type>",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.darkgrey,
                                        fontSizeFactor: 0.7)),
                            Text("See fewer posts like this",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.lightGrey,
                                        fontSizeFactor: 0.55)),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 2,
                              color: MyColors.extraLightGrey,
                              width: MediaQuery.of(context).size.width - 60,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/add-user.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Unfollow <Username>",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.darkgrey,
                                        fontSizeFactor: 0.7)),
                            Text("See fewer posts like this",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.lightGrey,
                                        fontSizeFactor: 0.55)),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 2,
                              color: MyColors.extraLightGrey,
                              width: MediaQuery.of(context).size.width - 60,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/report.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Report <Post type>",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.darkgrey,
                                        fontSizeFactor: 0.7)),
                            Text("See fewer posts like this",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.lightGrey,
                                        fontSizeFactor: 0.55)),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 2,
                              color: MyColors.extraLightGrey,
                              width: MediaQuery.of(context).size.width - 60,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Image.asset("assets/link.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Copy <Post type> link",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.darkgrey,
                                        fontSizeFactor: 0.7)),
                            Text("See fewer posts like this",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .apply(
                                        fontWeightDelta: 0,
                                        color: MyColors.lightGrey,
                                        fontSizeFactor: 0.55)),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
