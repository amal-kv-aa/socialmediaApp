
import 'package:flutter/material.dart';
import 'package:social_media/screens/otp/view/otp.dart';
import 'package:social_media/services/api/auth/api.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';
import '../../../widgets/loading/loading.dart';

class SignUpProvider with ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  bool isLoading = false;

//===============name validation===========//
  String? username(String value) {
    if (value.trim().isEmpty) {
      return 'name required';
    } else if (value.trim().length < 3) {
      return 'Username must be at least 3 characters in length';
    }
    return null;
  }

//===============email validation===========//
  String? emailValidate(String value) {
    if (value.isEmpty) {
      return 'email required';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'email formate invalid';
    }
    return null;
  }

//================phone number==============//
  String? phoneValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'phonenumber required';
    } else if (value.trim().length < 10) {
      return 'enter valid phonenumber';
    }
    return null;
  }

//================password==validate===============//
  String? passwordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'password required';
    } else if (value.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }

//===============confirm==password==========//
  String? confirmValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'confirmpassword required';
    } else if (value != passwordcontroller.text) {
      return "password not matching";
    }
    return null;
  }

  //===================form validation========//
  validate(BuildContext context) {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      Loding.progressbar(context);
      signup(context);
      return;
    }
  }
  
  //==========================signup======================//
  Future<void> signup(context) async {
    final user = User(
        username: usercontroller.text.trim(),
        fullname: fullnamecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        phoneNumber: phonenumbercontroller.text.trim(),
        password: passwordcontroller.text.trim(),
        confirmpassword: confirmcontroller.text.trim());

     ApiServices().signupRequest(user)!.then((value) {
  if (value == "success")
    {
      Navigator.pop(context);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => OtpScreen(user: user)));
      CustomSnackbar.showSnack(
          context: context, text: "OTP sended to your Phonenumber");
    } else {
      Navigator.pop(context);
      CustomSnackbar.showSnack(context: context, text: value);
    }
    });
  }
  updateLoding(bool value) {
    isLoading = value;
    notifyListeners();
  }          
}
