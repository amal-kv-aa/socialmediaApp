import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/messages/view/widgets/message_user/card_message.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(text: 'Messages',weight: FontWeight.w400,size: 19.h,),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: 80.h,
                width: double.infinity,
                child: const Stories(color: Colors.black),
              ),
              const MessageCard(color: Colors.red),
              const MessageCard(color: Colors.green),
              const MessageCard(color: Colors.green),
              const MessageCard(color: Colors.red),
              const MessageCard(color: Colors.green),
              const MessageCard(color: Colors.green),
              const MessageCard(color: Colors.green),
              const MessageCard(color: Colors.red),
              const MessageCard(color: Colors.red),
              const MessageCard(color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
