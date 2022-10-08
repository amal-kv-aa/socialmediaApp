import 'dart:convert';

class LoginModel {
  String email = '';
  String password = '';
  LoginModel({required this.email, required this.password});
  Map<String, String> tojson() {
    return {"email": email, "password": password};
  }
}


UserloginModel userloginModelFromJson(String str) => UserloginModel.fromJson(json.decode(str));


class UserloginModel {
    UserloginModel({
       required this.status,
       required this.msg,
       required this.token,
       required this.userDetails,
    });

    String status;
    String msg;
    String token;
    UserDetails userDetails;

    factory UserloginModel.fromJson(Map<String, dynamic> json) => UserloginModel(
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
    );
}

class UserDetails {
    UserDetails({
       required this.id,
        required this.username,
       required this.fullname,
       required this.email,
       required this.phoneNumber,
       required this.avatar,
       required this.bio,
       required this.posts,
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
    List<dynamic> posts;
    List<dynamic> followers;
    List<dynamic> saved;
    List<dynamic> following;
    bool private;
    bool blocked;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        avatar: json["avatar"],
        bio: json["bio"],
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        saved: List<dynamic>.from(json["saved"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        private: json["private"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

}
