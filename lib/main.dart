import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/desktop/provider/provider.dart';
import 'package:social_media/screens/google_signup/provider/google.provider.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/screens/login/provider/login_provider.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/screens/otp/provider/otp_provider.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/screens/sign_up/provider/sign_up_provider.dart';
import 'package:social_media/screens/splash/provider/splash_provider.dart';
import 'package:social_media/screens/splash/view/splash.dart';
import 'package:social_media/services/helper/helperfunction.dart';

void main() {
  //=======landscap rotation lock=========//
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>SplashProvider()),
      ChangeNotifierProvider(create: (_) =>LoginProvider()),
      ChangeNotifierProvider(create: (_) =>LobyProvider()),
      ChangeNotifierProvider(create: (_) =>SignUpProvider()),
      ChangeNotifierProvider(create: (_) =>DesktopProvider()),
      ChangeNotifierProvider(create: (_) =>OtpProvider()),
      ChangeNotifierProvider(create: (_) =>GooleSignupProvider()),
      ChangeNotifierProvider(create: (_) =>ProfileProvider())
      
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, widget) {
        return
         MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            iconTheme: IconThemeData(color: Colors.black, size: 22.h)),
        home:  
        
       const Splash()  ,
        debugShowCheckedModeBanner: false,
      );
      },
      
      designSize: const Size(375, 812),
    );
  }
}
