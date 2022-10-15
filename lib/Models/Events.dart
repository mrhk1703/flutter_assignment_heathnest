import 'package:flutter_assignment/Models/Comments.dart';

class Event {
  String title;
  String dateTime;
  List<String> interestedGoing;
  String location;

  Event(
      {this.title,
      this.dateTime,
      this.interestedGoing,
      this.location});

  Event.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dateTime = json['dateTime'];
    interestedGoing = json['interestedGoing'].cast<String>();
    
    location = json['location'];
  }

}