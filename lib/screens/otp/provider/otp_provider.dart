import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/services/api/auth/api.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';

class OtpProvider with ChangeNotifier {
  late AnimationController animcontroller;
  late AnimationController bganimcontroller;
  final TextEditingController otpController = TextEditingController();
  showanimation(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Lottie.asset(
              'assets/animation/91842-success.json',
              height: 150.h,
              controller: animcontroller,
              onLoaded: (composition) {
                animcontroller.forward();
                animcontroller.duration = composition.duration;
              },
            ),
          );
        });
  }
  showLoding({required BuildContext context}) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                const Text(
                  "checking OTP pleas wait",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 25.h,
                ),
                const CircularProgressIndicator()
              ],
            ),
          );
        });
  }
  showError(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Invalid OTP",
                style: TextStyle(color: Colors.red),
              ),
            ),
            content: const Icon(Icons.error_rounded),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("back"))
            ],
          );
        });
  }
  otpverify(BuildContext context, User user){ 
      ApiServices().otpVerify(
        otpModels: user, otp: otpController.text.trim())!.then((value) {
            if (value == "success") {
          showanimation(context);
        } else {
              CustomSnackbar.showSnack(
          context: context, text: value);
           showError(context);
        }
        });
      
        

  }
}
