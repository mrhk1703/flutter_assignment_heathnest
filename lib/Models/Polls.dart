import 'package:flutter_assignment/Models/Comments.dart';
import 'package:flutter_assignment/Models/PollsOptions.dart';

class Poll {
	String question;
	List<PollOptions> options;
	bool isPollOpen;
	List<String> likes;
	List<Comments> comments;
	String location;

	Poll({this.question, this.options, this.isPollOpen, this.likes, this.comments, this.location});

	Poll.fromJson(Map<String, dynamic> json) {
		question = json['question'];
		if (json['options'] != null) {
			options = <PollOptions>[];
			json['options'].forEach((v) { options.add(new PollOptions.fromJson(v)); });
		}
		isPollOpen = json['isPollOpen'];
		likes = json['likes'].cast<String>();
		if (json['comments'] != null) {
			comments = <Comments>[];
			json['comments'].forEach((v) { comments.add(new Comments.fromJson(v)); });
		}
		location = json['location'];
	}
}