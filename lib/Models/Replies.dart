class Replies {
  String userId;
  String reply;

  Replies({this.userId, this.reply});

  Replies.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['reply'] = this.reply;
    return data;
  }
}