import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/google_signup/provider/google.provider.dart';

class GoogleSignUpPage extends StatelessWidget {
  const GoogleSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            context.read<GooleSignupProvider>().login(context);
          },
          child: Row(
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
              const Text( 'sign up using Google Account',
               
              ),
            ],
          ),
        ),
      ],
    ),
    );
  }
}
