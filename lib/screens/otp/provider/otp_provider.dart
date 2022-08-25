import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OtpProvider with ChangeNotifier{
   late AnimationController animcontroller;
   late AnimationController bganimcontroller;
   showanimation(BuildContext context){
     showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_yo2zavgg.json',
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
}