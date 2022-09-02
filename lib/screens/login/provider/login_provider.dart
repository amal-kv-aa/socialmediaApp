import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/screens/login/model/model_login.dart';
import 'package:social_media/screens/main_home/main_home.dart';
import 'package:social_media/services/api/api.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController  emailcontroller = TextEditingController();
  TextEditingController passwodcontroller = TextEditingController();
final formkey = GlobalKey<FormState>();

  tologin(BuildContext context){
    final user = LoginModel(email: emailcontroller.text.trim(), password: passwodcontroller.text.trim());
    final response  = ApiServices().login(user, context);
    if (response is Response) {
      Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => MainHome()));
    }
  }
}
