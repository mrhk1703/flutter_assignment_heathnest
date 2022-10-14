class Comments {
	String userId;
	String comment;
	String image;
	List<String> upVotes;
	List<String> downVotes;
	List<String> replies;

	Comments({this.userId, this.comment, this.image, this.upVotes, this.downVotes, this.replies});

	Comments.fromJson(Map<String, dynamic> json) {
		userId = json['userId'];
		comment = json['comment'];
		image = json['image'];
		upVotes = json['upVotes'].cast<String>();
		downVotes = json['downVotes'].cast<String>();
		replies = json['replies'].cast<String>();
	}

}