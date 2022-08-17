import 'package:flutter/material.dart';
import 'package:social_media/screens/messages/view/widgets/message_user/card_message.dart';
import 'package:social_media/screens/profile/view/profile.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Scrollbar(
            child: ListView(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const Profile()));
                    },
                    child: const MessageCard(color: Colors.red,)),
                const MessageCard(color: Colors.green,),
                const MessageCard(color: Colors.green,),
                const MessageCard(color: Colors.red,),
                const MessageCard(color: Colors.green,),
                const MessageCard(color: Colors.red,),
                const MessageCard(color: Colors.red,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
