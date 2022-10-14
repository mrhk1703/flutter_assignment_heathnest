import 'package:flutter_assignment/Models/Events.dart';
import 'package:flutter_assignment/Models/Polls.dart';
import 'package:flutter_assignment/Models/Question.dart';
import 'package:flutter_assignment/Models/SimplePost.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';

class Feeds {
  String userId;
  String feedDateTime;
  String feedType;
  String subTitle;
  String feedSubtType;
  Question question;
  Poll poll;
  SimplePost simplePost;
  Event event;

  // not from DB

  bool isLiked;

  Feeds(
      {this.userId,
      this.isLiked,
      this.feedDateTime,
      this.feedType,
      this.subTitle,
      this.feedSubtType,
      this.question,
      this.poll,
      this.simplePost,
      this.event});

  Feeds.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    feedDateTime = json['feedDateTime'];
    feedType = json['feedType'];
    subTitle = json['subTitle'];
    feedSubtType = json['feedSubtType'];

    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    poll = json['poll'] != null ? new Poll.fromJson(json['poll']) : null;
    simplePost = json['simplePost'] != null
        ? new SimplePost.fromJson(json['simplePost'])
        : null;
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;

    isLiked = false;
    switch (feedSubtType) {
      case "poll":
        isLiked = poll.likes.contains(UserDetails.userId);
        break;
      case "question":
        isLiked = question.likes.contains(UserDetails.userId);

        break;
      case "event":
        isLiked = event.likes.contains(UserDetails.userId);
        break;
      case "simplePost":
        isLiked = simplePost.likes.contains(UserDetails.userId);
        break;
      default:
    }
  }
}
