import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';
import 'package:social_media/screens/login/view/login.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/services/helper/helperfunction.dart';

class SplashProvider with ChangeNotifier {
  Future gotoHome(BuildContext context) async {
    String? token = await HelperFunction().getAccestoken();
    log("..token......:.${token.toString()}");
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => token!.isNotEmpty ? MainHome() : const Login()));
    });
  }
}
