import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/chat/view/widgets/message/message.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            minRadius: 25.h,
            maxRadius: 25.h,
            backgroundImage: const NetworkImage(
                'https://tse4.mm.bing.net/th?id=OIP.XSZAFm-5JI7nriDLwZqRQQHaE7&pid=Api&P=0'),
          ),
        ),
        title: const CustomText(text: 'Ronin'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: Colors.black,
                size: 26.h,
              )),
          IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.video_call_sharp, size: 30.h, color: Colors.black))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.teal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: mob ? 120.w : 50,
                    height: 40.h,
                    child: const Message(content: 'how are you ?')),
                SizedBox(
                    height: 40.h,
                    width: mob ? 120.w : 50,
                    child: const Message(content: 'iam good')),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 60.h,
        color: Colors.teal,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: SizedBox(
                      width: 60.w,
                    ),
                  ),
                  hintText: 'Type a message',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      )),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
