import 'package:flutter/material.dart';
import 'package:flutter_assignment/Controllers/UserController.dart';
import 'package:flutter_assignment/Models/Feeds.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:flutter_assignment/Views/Feed/FeedTopWidget.dart';
import 'package:flutter_assignment/Views/Feed/MembersResponseWidget.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PollWidget extends StatelessWidget {
  final Feeds feed;
  PollWidget({Key key, @required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> lstOptions = [];
    int totalVotes = 0;
    feed.poll.options.forEach((element) {
      totalVotes = totalVotes + element.voting.length;
    });
    feed.poll.options.forEach((element) {
      lstOptions.add(Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 20,
          animation: true,
          lineHeight: 50,
          backgroundColor: MyColors.white,
          animationDuration: 2000,
          percent: ((element.voting.length * 100) / totalVotes) / 100,
          center: Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(element.optionName,
                      style: Theme.of(context).textTheme.headline6.apply(
                          color: MyColors.darkgrey, fontSizeFactor: 0.7)),
                ),
                Text(
                    ((element.voting.length * 100) / totalVotes)
                            .toStringAsFixed(0) +
                        " %",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .apply(color: MyColors.darkgrey, fontSizeFactor: 0.7))
              ],
            ),
          ),
          progressColor: MyColors.extraLightGrey,
          fillColor: MyColors.white,
        ),
      ));
    });
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(color: MyColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedTopWidget(feed: feed),
          feed.poll.question != null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(feed.poll.question,
                      style: Theme.of(context).textTheme.headline6.apply(
                          fontWeightDelta: 30,
                          color: MyColors.darkgrey,
                          fontSizeFactor: 0.8)),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Column(
              children: lstOptions,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(totalVotes.toString() + "  votes",
                    style: Theme.of(context).textTheme.headline6.apply(
                        color: MyColors.verLightGrey, fontSizeFactor: 0.8)),
                Container(
                  width: 4,
                  height: 4,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: MyColors.verLightGrey,
                      borderRadius: BorderRadius.circular(50)),
                ),
                Text(feed.poll.isPollOpen ? "Vote" : "Poll Ended",
                    style: Theme.of(context).textTheme.headline6.apply(
                        color: feed.poll.isPollOpen
                            ? MyColors.themeColor
                            : MyColors.verLightGrey,
                        fontSizeFactor: 0.8)),
              ],
            ),
          ),
              
              
        ],
      ),
    );
  }

}
