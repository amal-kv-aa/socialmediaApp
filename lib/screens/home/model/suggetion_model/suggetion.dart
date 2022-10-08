
import 'dart:convert';

List<SuggetionModel> suggetionModelFromJson(List list) => List<SuggetionModel>.from(list.map((x) => SuggetionModel.fromJson(x)));

String suggetionModelToJson(List<SuggetionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SuggetionModel {
    SuggetionModel({
       required this.id,
       required this.username,
       required this.fullname,
       required this.email,
       required this.phoneNumber,
       required this.password,
       required this.avatar,
       required this.bio,
       required this.posts,
       required this.followers,
       required this.saved,
       required this.following,
       required this.refreshToken,
       required this.private,
      required  this.blocked,
      required  this.createdAt,
       required this.updatedAt,
       required this.v,
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
    List<String> following;
    String refreshToken;
    bool private;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory SuggetionModel.fromJson(Map<String, dynamic> json) => SuggetionModel(
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
        following: List<String>.from(json["following"].map((x) => x)),
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
