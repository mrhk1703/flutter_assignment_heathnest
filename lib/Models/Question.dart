import 'package:flutter_assignment/Models/Comments.dart';

class Question {
	String question;
	String message;
	String location;

	Question({this.question, this.message, this.location});

	Question.fromJson(Map<String, dynamic> json) {
		question = json['question'];
		message = json['message'];
		location = json['location'];
	}

}