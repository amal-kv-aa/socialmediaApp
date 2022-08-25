import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/notifications/view/widgets/cards/notification_style.dart';
import 'package:social_media/utils/text_custom/Text.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
      elevation: 0,
      title: CustomText(text: 'Notifications',size: 19.h,weight:FontWeight.w400,)
      ),
      body: ListView(
        children: const [
          NotificationCard(
            color: Colors.white,
          ),
          NotificationCard(
            color: Colors.white,
          ),
          NotificationCard(
            color: Colors.white,
          ),
          NotificationCard(
            color: Colors.white,
          ),
          NotificationCard(
           color: Colors.white,
          ),
           NotificationCard(
            color: Colors.white,
          ),
           NotificationCard(
            color: Colors.white,
          ),
          NotificationCard(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
