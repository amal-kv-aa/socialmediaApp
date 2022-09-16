import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/sign_up/provider/sign_up_provider.dart';

class ModelTextfield extends StatelessWidget {
  const ModelTextfield(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validator,
      this.visibility,
      this.iconButton,
      })
      : super(key: key);
  final String hint;
  final bool? visibility;
  final IconButton? iconButton;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 4.h),
      child: Center(
        child: Consumer<SignUpProvider>(
          builder: (context, signupprovider, child){
            return
            TextFormField(
              obscureText:visibility?? false,
            controller: controller,
            style: const TextStyle(color: Colors.teal),
            decoration: InputDecoration(
              suffixIcon: iconButton,
                hintStyle: const TextStyle(color: Colors.grey),
                hintText: hint,
                border: const OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true),
            validator: validator,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.disabled,
          );
          }
        ),
      ),
    );
  }
}
