// To parse this JSON data, do
//
//     final postsDataModel = postsDataModelFromJson(jsonString);

import 'dart:convert';

List<PostsDataModel> postsDataModelFromJson(String str) =>
    List<PostsDataModel>.from(
        json.decode(str).map((x) => PostsDataModel.fromJson(x)));

String postsDataModelToJson(List<PostsDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsDataModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostsDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostsDataModel.fromJson(Map<String, dynamic> json) => PostsDataModel(
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
