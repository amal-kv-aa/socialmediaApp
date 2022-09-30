
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/newpost/provider/newpost_provider.dart';
import 'package:social_media/screens/sign_up/view/widgets/textfield/textfield.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<NewpostProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title:
            CustomText(text: "New Post", size: 20.h, weight: FontWeight.bold),
        actions: [
          IconButton(onPressed: () {
            context.read<NewpostProvider>().topost(context);
          }, icon: const Icon(Icons.verified))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 20.w),
              Container(
                decoration:   BoxDecoration(
                    image:  DecorationImage(
                        image:
                         FileImage(File(watch.imagepath!.path)),
                        // //: 
                        // AssetImage("assets/images/avatar-1-1536x1536.jpeg"),
                        fit: BoxFit.fill),
                    color: Colors.black),
                height: 170.h,
                width: 100.w,
              ),
              SizedBox(width: 20.w),
              Column(
                children: [
                  SizedBox(
                      height: 90.h,
                      width: 220.w,
                      child: ModelTextfield(
                          hint: "give caption",
                          controller: watch.captionController)),
                          SizedBox(
                  height: 60.h,
                  width: 220.w,
                  child: ModelTextfield(
                      hint: "tag :", controller: watch.tagController)),
                ],
              ),
                      
            ],
          )
        ],
      ),
    );
  }
}
