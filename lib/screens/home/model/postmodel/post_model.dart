import 'dart:convert';


List<PostModel> getPostModelFromJson(List list) =>
    List<PostModel>.from(list.map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
    PostModel({
      required  this.id,
      required  this.userId,
      required  this.image,
      required  this.caption,
      required  this.hashtags,
      required  this.likes,
      required  this.reportCount,
      required  this.savedBy,
       required this.comments,
       required this.createdAt,
      required  this.updatedAt,
      required  this.v,
    });

    String id;
    UserId userId;
    String image;
    String caption;
    List<dynamic> hashtags;
    List<String> likes;
    int reportCount;
    List<dynamic> savedBy;
    List<dynamic> comments;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        reportCount: json["reportCount"],
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "image": image,
        "caption": caption,
        "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "reportCount": reportCount,
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class UserId {
    UserId({
      required  this.id,
      required  this.username,
      required  this.fullname,
      required  this.email,
      required  this.phoneNumber,
      required  this.password,
      required  this.avatar,
      required  this.bio,
      required  this.posts,
      required  this.followers,
      required  this.saved,
      required  this.following,
      required  this.refreshToken,
      required  this.private,
      required  this.blocked,
      required  this.createdAt,
      required  this.updatedAt,
      required  this.v,
    });

    String id;
    String username;
    String fullname;
    String email;
    int phoneNumber;
    String password;
    String avatar;
    String bio;
    List<String> posts;
    List<dynamic> followers;
    List<dynamic> saved;
    List<dynamic> following;
    String refreshToken;
    bool private;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        avatar: json["avatar"],
        bio: json["bio"],
        posts: List<String>.from(json["posts"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        refreshToken: json["refreshToken"],
        private: json["private"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "fullname": fullname,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "avatar": avatar,
        "bio": bio,
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "refreshToken": refreshToken,
        "private": private,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

