import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/chat/view/chat.dart';
import 'package:social_media/screens/desktop/provider/provider.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/screens/main_home/view/widget/bottomnav.dart';
import 'package:social_media/screens/search/view/widgets/search_field/search.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DesktopProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Tailus',
            fontfamily: 'cursive',
            color: Colors.white,
            size: 30,
            weight: FontWeight.bold,
          ),
          actions: [
            value.showSearch
                ? SizedBox(
                    width: 120.w, height: 40.h, child: const SearchField())
                : const SizedBox(),
            SizedBox(
              width: 30.w,
            )
          ],
        ),
        body: Row(
          children: [
            Expanded(
              flex: ResponsiveStyle.isTablet(context) ? 0 : 3,
              child: const SizedBox(),
            ),
            Expanded(
              flex: value.islarge ? 8 : 5,
              child: value.secondScreen,
            ),
            value.islarge
                ? const SizedBox()
                : Expanded(flex: 3, child: value.firstScreen),
            Expanded(
                flex: ResponsiveStyle.isTablet(context) ? 0 : 3,
                child: Container())
          ],
        ),
      );
    });
  }
}

class IntroImage extends StatelessWidget {
  const IntroImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 200.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i0.wp.com/somention.com/wp-content/uploads/2018/11/kissclipart-transparent-iphone-x-hand-png-clipart-iphone-x-6416462b3e88f09d.png?fit=770%2C1057&ssl=1'),
        ),
      ),
    );
  }
}

class AccountDesktop extends StatelessWidget {
  const AccountDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const BottomNavItem(),
      ),
      body: context.watch<LobyProvider>().currentIndex == 1
          ? const ChatScreen()
          : const SizedBox(),
    );
  }
}
