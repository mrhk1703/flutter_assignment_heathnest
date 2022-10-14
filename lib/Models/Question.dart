import 'package:flutter_assignment/Models/Comments.dart';

class Question {
	String question;
	String message;
	List<String> likes;
	List<Comments> comments;
	String location;

	Question({this.question, this.message, this.likes, this.comments, this.location});

	Question.fromJson(Map<String, dynamic> json) {
		question = json['question'];
		message = json['message'];
		likes = json['likes'].cast<String>();
		if (json['comments'] != null) {
			comments = <Comments>[];
			json['comments'].forEach((v) { comments.add(new Comments.fromJson(v)); });
		}
		location = json['location'];
	}

}