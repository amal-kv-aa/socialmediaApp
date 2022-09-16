import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/splash/provider/splash_provider.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().
    gotoHome(context);
    return  Scaffold(
      body: Center(
        child: CustomText(
          text: "Tailus",
          weight: FontWeight.bold,
          size: 36.h,
          color: Colors.teal,
          fontfamily: 'cursive',
        ),
      ),
    );
  }
}
