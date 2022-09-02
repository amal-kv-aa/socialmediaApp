import 'package:flutter/material.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';

class SplashProvider with ChangeNotifier {
  Future gotoHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) => 
     Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const LobiScreen())));
   
  }
}
