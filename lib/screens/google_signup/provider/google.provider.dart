import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media/screens/google_signup/models/google_models.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/services/api/auth/api.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';

class GooleSignupProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  
  Future <void> login(BuildContext context)  {
    return
     googleSignIn.signIn().then((user){
       if (user == null)  
    {
      log("null....user");
      return;
    } else {
      log("hey....user");
     final googledata = GoogleModel(userEmail: user.email, password: user.id, userName: user.displayName!);

      log(user.email.toString());
      log(user.id.toString());
      log(user.displayName.toString());
      togoogleSignin(googledata, context);
    }
     });
   
  }

  Future logout()async{
 await googleSignIn.signOut();
 log("logout ok");
  }


  togoogleSignin(GoogleModel data, BuildContext context) {
    ApiServices().googleSignIn(data)!.then((value) {
      {
        if (value == "success") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>MainHome()));
        } 
         else  
        {
          CustomSnackbar.showSnack(context: context, text: value);
        }
      }
    });
  }
}
