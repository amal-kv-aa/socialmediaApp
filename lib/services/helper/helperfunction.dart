import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  String key = 'token';

  //==========to=store==accesstoken========//
  Future setAccesstocken(String accesstoken) async {
    SharedPreferences data = await SharedPreferences.getInstance();
    await data.setString(key, accesstoken);
  }

  //=========to==get===accesstoken======//
  Future<String>? getAccestoken() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    String? accesstoken = data.getString(key);
    return accesstoken ?? "";
  }

  //=========to==delete==accesstoken===//
  Future deleteAccestoken() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    await data.clear();
  }

  String userkey = 'userId';

  //==========to=store==UseerId========//
  Future setuserId(String userId) async {
    SharedPreferences userdata = await SharedPreferences.getInstance();
    await userdata.setString(userkey, userId);
  }

  //=========to==get===UseerId======//
  Future<String>? getuserId() async {
    SharedPreferences userdata = await SharedPreferences.getInstance();
    String? userId = userdata.getString(userkey);
    return userId ?? "no token";
  }

  //=========to==delete=UseerId===//
  Future deleteuserId() async {
    SharedPreferences userdata = await SharedPreferences.getInstance();
    await userdata.clear();
  }
}
