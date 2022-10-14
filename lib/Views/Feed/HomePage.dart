import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/FeedController.dart';
import 'package:flutter_assignment/Controllers/SimmerController.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Constants.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';
import 'package:flutter_assignment/Views/Feed/FeedDetailWidget.dart';
import 'package:flutter_assignment/Views/Feed/FeedTileWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';
import 'package:flutter_assignment/Views/LoginWidget.dart';

class MyHomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePageWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedFeedType = "All Posts";
  String defaultCommunity;
  Future<List<Feeds>> lstFutureFeeds;
  @override
  void initState() {
    defaultCommunity = "All Communities";
    lstFutureFeeds = FeedController.getFeeds(selectedFeedType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollViewController = new ScrollController();
    return Scaffold(
        backgroundColor: MyColors.extraLightGrey,
        key: _scaffoldKey,
        body: DefaultTabController(
          length: 1,
          child: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[appbar(context, innerBoxIsScrolled)];
              },
              body: RefreshIndicator(
                onRefresh: () async {
                  lstFutureFeeds = FeedController.getFeeds(selectedFeedType);
                  lstFutureFeeds.then((value) {
                    setState(() {});
                  });
                  await Future.delayed(Duration(seconds: 2));
                },
                child: FutureBuilder<List<Feeds>>(
                    future: lstFutureFeeds,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.isNotEmpty) {
                          return ListView.builder(
                              padding: const EdgeInsets.only(
                                  bottom: 80, top: 0, left: 0, right: 0),
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                if (index < snapshot.data.length) {
                                  return Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FeedDetailWidget(
                                                          feed: snapshot
                                                              .data[index],
                                                          refreshReaction: () {
                                                            setState(() {
                                                              snapshot
                                                                      .data[index]
                                                                      .isLiked =
                                                                  !snapshot
                                                                      .data[
                                                                          index]
                                                                      .isLiked;
                                                            });
                                                          })));
                                        },
                                        child: FeedTileWidget(
                                            feed: snapshot.data[index]),
                                      ),
                                      MemberResponseWidget(
                                        feed: snapshot.data[index],
                                        refreshResponse: () {
                                          setState(() {
                                            snapshot.data[index].isLiked =
                                                !snapshot.data[index].isLiked;
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              });
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                              child: Text("No Feeds.",
                                  style: TextStyle(color: MyColors.black))),
                        );
                      }
                      return SimmerController.listShimmers(context, 6);
                    }),
              )),
        ));
  }

  Widget searchField() {
    TextEditingController searchCon = new TextEditingController();
    return Container(
        padding: EdgeInsets.only(bottom: 8, top: 12),
        color: MyColors.white,
        child: Column(
          children: [
            Container(
              height: 36,
              child: Container(
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 72,
                      decoration: BoxDecoration(
                        color: MyColors.white,
                        border:
                            Border.all(width: 0.3, color: MyColors.themeColor),
                      ),
                      child: TextField(
                        controller: searchCon,
                        autofocus: false,
                        readOnly: true,
                        onChanged: (value) {},
                        style: TextStyle(color: MyColors.black, fontSize: 12),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search post and members",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                .merge(TextStyle(
                                    fontSize: 13, color: MyColors.lightGrey)),
                            suffixIcon: Image.asset("assets/search.png",
                                color: MyColors.lightGrey),
                            fillColor: MyColors.white,
                            filled: true),
                        onTap: () {},
                      ),
                    ),
                    Image.asset("assets/bell.png",height: 32,width: 32,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 24.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Constants.feedsTypes.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedFeedType = Constants.feedsTypes[index];
                        lstFutureFeeds =
                            FeedController.getFeeds(selectedFeedType);
                      });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:
                                selectedFeedType == Constants.feedsTypes[index]
                                    ? MyColors.themeColor.withOpacity(0.15)
                                    : MyColors.white,
                            border:
                                selectedFeedType == Constants.feedsTypes[index]
                                    ? null
                                    : Border.all(
                                        width: 0.2,
                                        color: MyColors.themeColor)),
                        padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                        child: Text(Constants.feedsTypes[index],
                            style: Theme.of(context).textTheme.headline6.apply(
                                fontSizeFactor: 0.65,
                                color: MyColors.themeColor))),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget appbar(context, innerBoxIsScrolled) {
    return SliverAppBar(
      backgroundColor: MyColors.white,
      title: Container(
          padding: EdgeInsets.only(top: 6),
          color: MyColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("COMMUNITY",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline6.apply(
                              fontSizeFactor: 0.6,
                              fontWeightDelta: 10,
                              color: MyColors.lightGrey,
                            )),
                    Container(
                      height: 28,
                      child: DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          value: defaultCommunity,
                          icon: Icon(Icons.arrow_drop_down_outlined,
                              color: MyColors.themeColor),
                          items: ['All Communities'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .apply(
                                          color: MyColors.themeColor,
                                          fontWeightDelta: 10,
                                          fontSizeFactor: 0.8)),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              defaultCommunity = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  UserController.performLogout().then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginWidget()),
                      (Route<dynamic> route) => false);
                });
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage("assets/" + UserDetails.profileImage),
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ],
          )),
      floating: true,
      forceElevated: innerBoxIsScrolled,
      pinned: true,
      elevation: 0.0,
      bottom: new PreferredSize(
        preferredSize: new Size(94.0, 94.0),
        child: new Container(
          color: MyColors.white,
          width: MediaQuery.of(context).size.width,
          child: new TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              new Container(
                child: searchField(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void homeRefresh() {
    setState(() {});
  }
}
