class LoginModel {
  String email = '';
  String password = '';
  LoginModel({required this.email, required this.password});
  Map<String, String> tojson() {
    return {"email": email, "password": password};
  }
}