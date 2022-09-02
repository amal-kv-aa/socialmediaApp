
class User {
  String username = '';
  String fullname = '';
  String email = '';
  String password = '';
  String confirmpssword = '';
  String phoneNumber = '';
  User(
      {required this.username,
      required this.fullname,
      required this.email,
      required this.password,
      required this.confirmpssword,
      required this.phoneNumber});
  Map<String, String> tojson() {
    return {
      "username": username,
      "fullname": fullname,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "confirmPassword": confirmpssword
    };
  }
}
