class Users {
  String userId;
  String userName;
  String profileImage;
  String userType;
  String mobileNumber;

  Users({this.userId, this.userName, this.profileImage, this.userType});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    profileImage = json['profileImage'];
    userType = json['userType'];
        mobileNumber = json['mobileNumber'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['profileImage'] = this.profileImage;
    data['userType'] = this.userType;
        data['mobileNumber'] = this.mobileNumber;

    return data;
  }
}