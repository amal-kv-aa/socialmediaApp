
class User {
  String? username ;
  String? fullname;
  String? email;
  String? password;
  String? confirmpassword;
  String? phoneNumber;
  User(
      { this.username,
       this.fullname,
       this.email,
       this.password,
       this.confirmpassword,
       this.phoneNumber,});
  Map<String, String> tojson() {
    return 
    {
      "username": username!,
      "fullname": fullname!,
      "email": email!,
      "password": password!,
      "phoneNumber": phoneNumber!,
      "confirmPassword":confirmpassword!
    };
  }
  factory User.fromjson(Map <String,String>json)
  {
   return
   User(
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    password: json["password"],
    confirmpassword: json["confirmpassword"],
    phoneNumber: json["phoneNumber"]
   );
  }
}
