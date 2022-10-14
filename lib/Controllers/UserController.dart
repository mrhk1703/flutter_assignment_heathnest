import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/Models/UserDetails.dart';
import 'package:flutter_assignment/Models/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserController {
  static Future<List<Users>> login(String mobileNumber) async {
    List<Users> lstUsers = [];
    try {
      String response =
          await rootBundle.loadString('assets/datajsons/users.json');
      List jsonResponse = jsonDecode(response);
      lstUsers = jsonResponse.map((e) => Users.fromJson(e)).toList();
      lstUsers.retainWhere((element) => element.mobileNumber == mobileNumber);
    } catch (e) {
      print(e);
    }
    return lstUsers;
  }

  static Future<List<Users>> getUserById(String userId) async {
    List<Users> lstUsers = [];
    try {
      String response =
          await rootBundle.loadString('assets/datajsons/users.json');
      List jsonResponse = jsonDecode(response);
      lstUsers = jsonResponse.map((e) => Users.fromJson(e)).toList();
      lstUsers.retainWhere((element) => element.userId == userId);
      print(lstUsers[0].userId);
    } catch (e) {
      print(e);
    }
    return lstUsers;
  }

   static Future<void> performLogout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("id");
    UserDetails.userName = null;
    UserDetails.userId = null;
    UserDetails.profileImage = null;
    UserDetails.mobileNumber = null;
    UserDetails.userType = null;
  }

   static Future<void> saveUserDetails(Users user) async {
     UserDetails.userName = user.userName;
    UserDetails.userId = user.userId;
    UserDetails.profileImage = user.profileImage;
    UserDetails.mobileNumber = user.mobileNumber;
    UserDetails.userType = user.userType;
  }
}
