import 'package:flutter_assignment/Models/Comments.dart';
import 'package:flutter_assignment/Models/PollsOptions.dart';

class Poll {
	String question;
	List<PollOptions> options;
	bool isPollOpen;
	String location;

	Poll({this.question, this.options, this.isPollOpen, this.location});

	Poll.fromJson(Map<String, dynamic> json) {
		question = json['question'];
		if (json['options'] != null) {
			options = <PollOptions>[];
			json['options'].forEach((v) { options.add(new PollOptions.fromJson(v)); });
		}
		isPollOpen = json['isPollOpen'];
		location = json['location'];
	}
}