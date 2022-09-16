import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/view/home.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/screens/main_home/view/widget/bottomnav.dart';
import 'package:social_media/screens/messages/view/messages.dart';
import 'package:social_media/screens/notifications/view/notifications.dart';
import 'package:social_media/screens/profile/view/profile.dart';
import 'package:social_media/screens/search/view/search.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class MainHome extends StatelessWidget {
  MainHome({Key? key}) : super(key: key);
  final List _pages = [
    const Home(),
    const MessagesPage(),
    const Search(),
    const NotificationsPage(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[context.watch<LobyProvider>().currentIndex],
      bottomNavigationBar:ResponsiveStyle.isMobile(context)?
      const BottomNavItem() :const SizedBox(),
    );
  }
}
