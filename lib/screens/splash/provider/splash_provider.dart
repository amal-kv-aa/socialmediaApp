import 'package:flutter/material.dart';
import 'package:social_media/screens/login/view/login.dart';

class SplashProvider with ChangeNotifier {
  Future gotoHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 0));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const Login()));
  }
}
