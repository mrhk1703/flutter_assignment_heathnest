class UserDetails {
  static String userId;
  static String userName;
  static String profileImage;
  static String userType;
  static String mobileNumber;

  UserDetails({userId, userName, profileImage, userType, mobileNumber});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    profileImage = json['profileImage'];
    userType = json['userType'];
    mobileNumber = json['mobileNumber'];
  }
}
