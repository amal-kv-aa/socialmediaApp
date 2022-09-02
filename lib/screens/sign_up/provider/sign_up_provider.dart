import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:social_media/screens/otp/view/otp.dart';
import 'package:social_media/services/api/api.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/utils/snackbar/snackbar.dart';

class SignUpProvider with ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

//===============name validation===========//
  String? username(String value) {
    if (value.trim().isEmpty) {
      return 'name required';
    } else if (value.trim().length < 3) {
      return 'Username must be at least 4 characters in length';
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
      return 'This field is required';
    } else if (value.trim().length < 10) {
      return 'enter valid phonenumber';
    }
    return null;
  }

//================password==validate===============//
  String? passwordValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
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
      signup(context);
      return;
    }
  }

  //==========================signup======================//

  signup(BuildContext context) async {
    final user = User(
        username: usercontroller.text.trim(),
        fullname: fullnamecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        phoneNumber: phonenumbercontroller.text.trim(),
        password: passwordcontroller.text.trim(),
        confirmpssword: confirmcontroller.text.trim());

    final response = await ApiServices().signupRequest(user, context);

    if (response is Response) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => OtpScreen(
                user: user,
              )));
      CustomSnackbar.showSnack(
          context: context, text: "OTP sended to your Phonenumber");
    }
  }
}
