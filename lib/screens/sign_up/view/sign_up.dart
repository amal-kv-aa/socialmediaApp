import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/sign_up/provider/sign_up_provider.dart';
import 'package:social_media/screens/sign_up/view/widgets/google_signup/google_signup.dart';
import 'package:social_media/screens/sign_up/view/widgets/textfield/textfield.dart';
import 'package:social_media/utils/text_custom/text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Consumer<SignUpProvider>(
          builder: (context, provider, child) => Form(
            key: provider.formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: CustomText(text: 'Sign Up', size: 28.h),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ModelTextfield(
                      hint: 'name', controller: provider.namecontroller),
                  ModelTextfield(
                      hint: 'fullname', controller: provider.namecontroller),
                  ModelTextfield(
                    hint: 'phonenumber',
                    controller: provider.emailcontroller,
                    validator: (value) => provider.name(value!),
                  ),
                  ModelTextfield(
                    hint: 'email',
                    controller: provider.emailcontroller,
                    validator: (value) => provider.name(value!),
                  ),
                  ModelTextfield(
                    hint: 'password',
                    controller: provider.passwordcontroller,
                  ),
                  ModelTextfield(
                    hint: 'confirm password',
                    controller: provider.confirmcontroller,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<SignUpProvider>().validate(context);
                      },
                      child: const Text('sign-up')),
                  SizedBox(
                    height: 20.h,
                  ),
                  const GoogleSignUp(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                    child: const Divider(
                      thickness: 2,
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  Center(
                    child: RichText(
                        text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w200)),
                        TextSpan(
                            text: "  Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.h),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context))
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}