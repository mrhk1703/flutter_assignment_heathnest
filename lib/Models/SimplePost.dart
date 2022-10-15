import 'package:flutter_assignment/Models/Comments.dart';

class SimplePost {
	String image;
	List<String> hashTags;
	String description;
	String location;

	SimplePost({this.image, this.hashTags, this.description, this.location});

	SimplePost.fromJson(Map<String, dynamic> json) {
		image = json['image'];
		hashTags = json['hashTags'].cast<String>();
		description = json['description'];
		location = json['location'];
	}

}