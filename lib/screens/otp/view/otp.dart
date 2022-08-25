import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';
import 'package:social_media/screens/main_home/main_home.dart';
import 'package:social_media/screens/otp/provider/otp_provider.dart';
import 'package:social_media/utils/text_custom/text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<OtpProvider>().animcontroller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    context.read<OtpProvider>().bganimcontroller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    context
        .read<OtpProvider>()
        .animcontroller
        .addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => MainHome()));
        context.read<OtpProvider>().animcontroller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<OtpProvider>(
                builder: (context, value, child) {
                  return Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_zl2c0cuv.json',
                      controller: value.bganimcontroller,
                      onLoaded: (compossition) {
                    value.bganimcontroller.forward();
                  });
                },
              ),
              const CustomText(
                text: 'enter OTP',
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 240.w,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: true,
                  obscuringCharacter: '*',
                  obscuringWidget: const Icon(
                    Icons.https_outlined,
                    color: Colors.white,
                  ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    // if (v!.length < 3) {
                    //   return "I'm from validator";
                    // } else {
                    return null;
                    // }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.teal,
                      inactiveColor: Colors.black,
                      errorBorderColor: Colors.red,
                      activeColor: Colors.black,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.teal,
                      selectedColor: Colors.white),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(3, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  onTap: () {},
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'resend otp',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ),
                  SizedBox(
                    width: 30.w,
                  )
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<OtpProvider>().showanimation(context);
                  },
                  child: const Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
