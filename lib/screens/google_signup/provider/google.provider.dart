import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/screens/home/home.dart';

class GooleSignupProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  Future<void> login(BuildContext context) {
    return googleSignIn.signIn().then((user) {
      if (user == null) {
        log("null....user");
        return;
      } else {
       
        log("signup success full");
        log(user.email.toString());
        log(user.id.toString());
        log(user.displayName.toString());
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> Home(username: user.displayName,)));
      }
    });
  }

  Future logout() async {
    await googleSignIn.signOut();
    log("logout ok");
    }
}
