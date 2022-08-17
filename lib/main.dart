import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/screens/login/proivder/login_provider.dart';
import 'package:social_media/screens/splash/provider/splash_provider.dart';
import 'package:social_media/screens/splash/view/splash.dart';
import 'package:social_media/utils/responsive/responsive.dart';

void main() {
  runApp(MultiProvider(providers: [
   ChangeNotifierProvider(create: (_) => SplashProvider()),
   ChangeNotifierProvider(create: (_)=> LoginProvider()),
   ChangeNotifierProvider(create: (_)=>LobyProvider()),
   ChangeNotifierProvider(create: (_)=>Responsive())
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,

        iconTheme:const IconThemeData(color: Colors.black)
      ),
      home: const Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
