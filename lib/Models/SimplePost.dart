import 'package:flutter_assignment/Models/Comments.dart';

class SimplePost {
	String image;
	List<String> hashTags;
	String description;
	List<String> likes;
	List<Comments> comments;
	String location;

	SimplePost({this.image, this.hashTags, this.description, this.likes, this.comments, this.location});

	SimplePost.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		hashTags = json['hashTags'].cast<String>();
		description = json['description'];
		likes = json['likes'].cast<String>();
		if (json['comments'] != null) {
			comments = <Comments>[];
			json['comments'].forEach((v) { comments.add(new Comments.fromJson(v)); });
		}
		location = json['location'];
	}

}