class UserData{
  UserData({
    required this.email,
    required this.tocken,
    required this.username
  });
    String username ='';
  String tocken =''; 
  String email ='';
 static fromJson(Map<String,dynamic>json){
    return
      UserData(email: json["email"], tocken: json["token"], username: json["username"]);
  }
}