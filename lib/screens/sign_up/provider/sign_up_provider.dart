import 'package:flutter/material.dart';
import 'package:social_media/screens/otp/view/otp.dart';

class SignUpProvider with ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

//===============name validation===========//
  String? name(String value) {
    if (value.isEmpty) {
      return 'required';
    }
    return null;
  }

  //===================form validation========//
  validate(BuildContext context) {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      namecontroller.clear();
      emailcontroller.clear();
      passwordcontroller.clear();
      confirmcontroller.clear();
      notifyListeners();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const OtpScreen()));
      return;
    }
  }
}
