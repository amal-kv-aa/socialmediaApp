import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';
import 'package:social_media/screens/login/proivder/login_provider.dart';
import 'package:social_media/screens/profile/view/profile.dart';
import 'package:social_media/utils/enum/colors/colors.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Lottie.asset('assets/animation/38435-register.json'),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: size.width*0.15,right: size.width*0.15),
                  child: TextField(
                    onTap: () =>
                        context.read<LoginProvider>().changecolor(true),
                        style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        fillColor:
                            context.watch<LoginProvider>().isTaped == true
                                ? EnumCOlors.color
                                : EnumCOlors.color.withOpacity(0.7),
                        filled: true,
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                Padding(
                  padding: EdgeInsets.only(left: size.width*0.15,right: size.width*0.15),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onTap: ()=>context.read<LoginProvider>().changecolor(true),
                    decoration: InputDecoration(
                        fillColor:  context.watch<LoginProvider>().isTaped == true
                                ? EnumCOlors.color
                                : EnumCOlors.color.withOpacity(0.7),
                        filled: true,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(height: size.height*0.02,),
                ElevatedButton(
                    onPressed: () {
                      context.read<Responsive>().checkdevice(size);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => LobiScreen()));
                        
                    },
                    child: const Text('Login'))
              ],
            ))
          ],
        )),
      ),
    );
  }
}
