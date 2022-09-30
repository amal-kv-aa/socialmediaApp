import 'dart:convert';

List<PostModel> getPostModelFromJson(List list) =>
    List<PostModel>.from(list.map((x) => PostModel.fromJson(x)));

String getPostModelToJson(List<PostModel> data) =>
    json.encode(List<String>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    required this.id,
    required this.userId,
    required this.image,
    required this.caption,
    required this.hashtags,
    required this.likes,
    required this.savedBy,
    required this.createdAt,
    required this.comments,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String image;
  final String caption;
  final List<dynamic> hashtags;
  final List<dynamic> likes;
  final List<dynamic> savedBy;
  final String createdAt;
  final List<dynamic> comments;
  final DateTime updatedAt;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        userId: "user",
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        createdAt: json["createdAt"],
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "caption": caption,
        "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "createdAt": createdAt,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "updatedAt": updatedAt.toIso8601String()
      };
}





