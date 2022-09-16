import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class Message extends StatelessWidget {
  const Message({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return
    Flexible(
      child: SizedBox(
        width: 70.w,
        child: Card(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              child: CustomText(text: content),
            ),
          ),
        ),
      ),
    );
  }
}