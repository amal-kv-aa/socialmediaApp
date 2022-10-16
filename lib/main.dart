import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/google_signup/provider/google.provider.dart';
import 'package:social_media/screens/google_signup/view/google_signup/google_signup.dart';
void main() {
  //=======landscap rotation lock=========//
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
    providers: [
    
      ChangeNotifierProvider(create: (_) =>GooleSignupProvider()),
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
        
       const GoogleSignUpPage(),
        debugShowCheckedModeBanner: false,
      );
      },
      
      designSize: const Size(375, 812),
    );
  }
}
