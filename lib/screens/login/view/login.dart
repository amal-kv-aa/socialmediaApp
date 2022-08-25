import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/desktop/provider/provider.dart';
import 'package:social_media/screens/desktop/view/desktop.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';
import 'package:social_media/screens/login/provider/login_provider.dart';
import 'package:social_media/screens/main_home/main_home.dart';
import 'package:social_media/screens/sign_up/view/sign_up.dart';
import 'package:social_media/screens/sign_up/view/widgets/google_signup/google_signup.dart';
import 'package:social_media/screens/sign_up/view/widgets/textfield/textfield.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/utils/text_custom/Text.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CustomText(
                    text: "Tailus",
                    fontfamily: 'cursive',
                    weight: FontWeight.bold,
                    size: 34,
                  ),
                ),
                SizedBox(
                  height: 70.h,
                  width: 280.w,
                  child: ModelTextfield(
                      hint: 'email',
                      controller:
                          context.read<LoginProvider>().emailcontroller),
                ),
                SizedBox(
                  height: 70.h,
                  width: 280.w,
                  child: ModelTextfield(
                      hint: 'password',
                      controller:
                          context.read<LoginProvider>().passwodcontroller),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 280.w,
                  height: 30.h,
                  child: ElevatedButton(
                    onPressed: () {

                      ResponsiveStyle.isMobile(context)
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => MainHome()))
                          : context.read<DesktopProvider>().updateSize(false);
                      context
                          .read<DesktopProvider>()
                          .updateWidgetFirst(const AccountDesktop());
                      context
                          .read<DesktopProvider>()
                          .updateWidgetSeconde(MainHome());
                      context.read<DesktopProvider>().searchshowUpdate(true);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    child: const Text(
                      'Login',
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 30.h,
            ),
      //=====custom===widget=======//
            const GoogleSignUp(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
              child: const Divider(
                thickness: 2,
                color: Color.fromARGB(255, 207, 207, 207),
              ),
            ),
            RichText(
                text: TextSpan(
              children: [
                const TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200)),
                TextSpan(
                    text: "  Sign-up",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 16.h),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ResponsiveStyle.isMobile(context)
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const SignUpScreen()))
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const LobiScreen()));
                        context.read<DesktopProvider>().updateSize(true);
                        context
                            .read<DesktopProvider>()
                            .updateWidgetFirst(const SizedBox());
                        context
                            .read<DesktopProvider>()
                            .updateWidgetSeconde(const SignUpScreen());
                      }),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
