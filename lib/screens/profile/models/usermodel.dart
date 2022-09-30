import 'dart:convert';

class UserPostModels{
  String image ="";
  String caption ="";
  String userId ="";
  UserPostModels({required this.caption,required this.image,required this.userId});

  Map<String,String>toJson()
  {
    return
    {
      "image":image,
      "caption":caption,
      "userId":caption
    };
  }
}


ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
// List<ProfileModel> getProfileModelFromJson(List list) =>
//     List<ProfileModel>.from(list.map((x) => ProfileModel.fromJson(x)));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
       required this.otherDetails,
      required  this.currentUserPosts,
    });

    OtherDetails otherDetails;
    List<CurrentUserPost> currentUserPosts;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        otherDetails: OtherDetails.fromJson(json["otherDetails"]),
        currentUserPosts: List<CurrentUserPost>.from(json["currentUserPosts"].map((x) => CurrentUserPost.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "otherDetails": otherDetails.toJson(),
        "currentUserPosts": List<dynamic>.from(currentUserPosts.map((x) => x.toJson())),
    };
}

class CurrentUserPost {
    CurrentUserPost({
       required this.id,
       required this.userId,
       required this.image,
       required this.caption,
       required this.hashtags,
       required this.likes,
       required this.savedBy,
       required this.comments,
       required this.createdAt,
       required this.updatedAt,
      required  this.v,
    });

    String id;
    String userId;
    String image;
    String caption;
    List<dynamic> hashtags;
    List<String> likes;
    List<dynamic> savedBy;
    List<dynamic> comments;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory CurrentUserPost.fromJson(Map<String, dynamic> json) => CurrentUserPost(
        id: json["_id"],
        userId: json["userId"],
        image: json["image"],
        caption: json["caption"],
        hashtags: List<dynamic>.from(json["hashtags"].map((x) => x)),
        likes: List<String>.from(json["likes"].map((x) => x)),
        savedBy: List<dynamic>.from(json["savedBy"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "image": image,
        "caption": caption,
        "hashtags": List<dynamic>.from(hashtags.map((x) => x)),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "savedBy": List<dynamic>.from(savedBy.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class OtherDetails {
    OtherDetails({
       required this.id,
       required this.username,
       required this.fullname,
       required this.email,
       required this.phoneNumber,
       required this.avatar,
       required this.bio,
       required this.followers,
       required this.saved,
       required this.following,
       required this.private,
       required this.blocked,
       required this.createdAt,
       required this.updatedAt,
       required this.v,
    });

    String id;
    String username;
    String fullname;
    String email;
    int phoneNumber;
    String avatar;
    String bio;
    List<dynamic> followers;
    List<dynamic> saved;
    List<dynamic> following;
    bool private;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory OtherDetails.fromJson(Map<String, dynamic> json) => OtherDetails(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        avatar: json["avatar"],
        bio: json["bio"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
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
        "avatar": avatar,
        "bio": bio,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "saved": List<dynamic>.from(saved.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "private": private,
        "blocked": blocked,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
