import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/screens/otp/provider/otp_provider.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/screens/sign_up/provider/sign_up_provider.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key ,required this. user}) : super(key: key);
 final User? user;
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     final read = context.read<OtpProvider>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<OtpProvider>(
                builder: (context, value, child) {
                  return Lottie.asset(
                      'assets/animation/105173-verification-code-otp.json',
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
                    return null;
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
                  keyboardType: TextInputType.number,
                  controller: context.watch<OtpProvider>().otpController,
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
                  onTap: () {

                  },
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  beforeTextPaste: (text) {
                    debugPrint('');
                    return true;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'resend OTP',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          context.read<SignUpProvider>().signup(context);
                        }),
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
                    read.otpverify(context,widget.user!);
                    read.showLoding(context: context);
                  },
                  child: const Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
