import 'package:flutter/material.dart';
import 'package:social_media/screens/desktop/view/desktop.dart';
import 'package:social_media/screens/login/view/login.dart';
import 'package:social_media/screens/main_home/main_home.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class LobiScreen extends StatelessWidget {
  const LobiScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: ResponsiveStyle(
            //===============================mobile view==========================//
            mobile: Login(),
            //===============================tablet view==========================//
            tablet: DesktopView(),
            //===============================desktop view=========================//
            desktop : DesktopView()));
  }
}
