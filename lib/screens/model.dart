// To parse this JSON data, do
//
//     final simplePosts = simplePostsFromJson(jsonString);

import 'dart:convert';

List<SimplePosts> simplePostsFromJson(String str) => List<SimplePosts>.from(json.decode(str).map((x) => SimplePosts.fromJson(x)));

String simplePostsToJson(List<SimplePosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SimplePosts {
  int userId;
  int id;
  String title;
  String body;

  SimplePosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory SimplePosts.fromJson(Map<String, dynamic> json) => SimplePosts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
