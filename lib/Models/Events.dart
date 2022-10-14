import 'package:flutter_assignment/Models/Comments.dart';

class Event {
  String title;
  String dateTime;
  List<String> likes;
  List<String> interestedGoing;
  List<Comments> comments;
  String location;

  Event(
      {this.title,
      this.dateTime,
      this.likes,
      this.interestedGoing,
      this.comments,
      this.location});

  Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dateTime = json['dateTime'];
    likes = json['likes'].cast<String>();
    interestedGoing = json['interestedGoing'].cast<String>();
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    location = json['location'];
  }

}