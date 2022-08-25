import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/utils/text_custom/text.dart';

class GoogleSignUp extends StatelessWidget {
  const GoogleSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 10.h,
          minRadius: 10.h,
          backgroundImage: const AssetImage('assets/images/th.jpg'),
        ),
        SizedBox(
          width: 5.h,
        ),
        const CustomText(
          text: 'sign up using Google Account',
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
