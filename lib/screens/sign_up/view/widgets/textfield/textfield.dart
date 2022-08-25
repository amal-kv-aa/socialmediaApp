import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/sign_up/provider/sign_up_provider.dart';

class ModelTextfield extends StatelessWidget {
  const ModelTextfield(
      {Key? key,
      required this.hint,
      required this.controller,
      this.validator})
      : super(key: key);
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Center(
        child: Consumer<SignUpProvider>(
          builder: (context, signupprovider, child){
            return
            TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.teal),
            decoration: InputDecoration(
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
