import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/Models/Feeds.dart';

abstract class FeedController {
  static Future<List<Feeds>> getFeeds(String type) async {
    List<Feeds> lstFeeds = [];
    try {
      String response =
          await rootBundle.loadString('assets/datajsons/feeds.json');
      List jsonResponse = jsonDecode(response);
      lstFeeds = jsonResponse.map((e) => Feeds.fromJson(e)).toList();
      if (type != "All Posts") {
        lstFeeds.retainWhere(
            (element) => element.feedType.toLowerCase() == type.toLowerCase());
      }
    } catch (e) {
      print(e);
    }
    return lstFeeds;
  }
}
