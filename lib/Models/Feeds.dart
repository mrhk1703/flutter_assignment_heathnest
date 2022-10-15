import 'package:flutter_assignment/Models/Events.dart';
import 'package:flutter_assignment/Models/Polls.dart';
import 'package:flutter_assignment/Models/Question.dart';
import 'package:flutter_assignment/Models/SimplePost.dart';
import 'package:flutter_assignment/Models/Comments.dart';

import 'package:flutter_assignment/Models/UserDetails.dart';

class Feeds {
  String userId;
  String feedDateTime;
  String feedType;
  String subTitle;
  String feedSubtType;
  List<String> likes;
  List<Comments> comments;
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
      this.likes,
      this.comments,
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
likes = json['likes'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    poll = json['poll'] != null ? new Poll.fromJson(json['poll']) : null;
    simplePost = json['simplePost'] != null
        ? new SimplePost.fromJson(json['simplePost'])
        : null;
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;

   
    
        isLiked = likes.contains(UserDetails.userId);
       
  }
}
