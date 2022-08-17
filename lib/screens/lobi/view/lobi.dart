import 'package:flutter/material.dart';
import 'package:social_media/screens/home/view/home.dart';
import 'package:social_media/screens/main_home/main_home.dart';
import 'package:social_media/screens/messages/view/messages.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class LobiScreen extends StatelessWidget {
  const LobiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ResponsiveStyle(
            mobile: MainHome(),
            tablet: Container(),
            desktop: SizedBox(
              height: size.height*1,
              width: size.width*1,
              child: Row(
                children: [
                  Expanded(
                      flex: size.width > 1340 ? 4 : 8,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MessagesPage(),
                      )),
                  Expanded(
                      flex: size.width > 1340 ? 8 : 10,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Home(),
                      )),
                  Expanded(
                      flex: size.width > 1340 ? 6 : 8,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.black,
                        ),
                      )),
                ],
              ),
            )));
  }
}
