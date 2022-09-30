import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:social_media/screens/login/view/login.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/services/helper/helperfunction.dart';
import 'package:social_media/utils/user/current_user.dart';

class SplashProvider with ChangeNotifier {
  Future gotoHome(BuildContext context) async {
    String? token = await HelperFunction().getAccestoken();
    String id = await  HelperFunction().getuserId()!;
    log(id);
    CurrentUser.userId=id;
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => token!.isNotEmpty ? MainHome() : const Login()));
    });
  }
}
