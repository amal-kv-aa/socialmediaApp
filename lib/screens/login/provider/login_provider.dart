import 'package:flutter/material.dart';
import 'package:social_media/screens/home/model/postmodel/post_model.dart';
import 'package:social_media/screens/login/model/model_login.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/services/api/auth/api.dart';
import 'package:social_media/widgets/loading/loading.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwodcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool visibility = true;
  PostModel? userDetails;
  

  visibleupdate() {
    visibility = !visibility;
    notifyListeners();
  }

  validate(BuildContext context) {
    if (formkey.currentState!.validate()) {
      final user = LoginModel(
          email: emailcontroller.text.trim(),
          password: passwodcontroller.text.trim());
      Loading(context).progressbar(true);
      tologin(user, context);
    } else {
      return;
    }
  }

  tologin(LoginModel user, BuildContext context) {
    ApiServices().login(user)!.then((value) {
      {
        if (value == "success")
        {
         Loading(context).progressbar(false);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => MainHome()));
        } 
         else  
        {
          Loading(context).progressbar(false);
          CustomSnackbar.showSnack(context: context, text: value);
        }
      }
    });
  }
}

