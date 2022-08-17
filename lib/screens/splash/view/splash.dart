import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/splash/provider/splash_provider.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SplashProvider>().gotoHome(context);
    final size = MediaQuery.of(context).size;
    return
    Container(
      color: Colors.white,
      child:
      ListView(
        children: [
           SizedBox(height: size.height*0.2,),
          Lottie.network('https://assets5.lottiefiles.com/packages/lf20_QpolL2.json',height: size.height*0.4),
          Lottie.network('https://assets8.lottiefiles.com/packages/lf20_poqmycwy.json',height: size.height*0.3),
        ],
      ),
    );
  }
}