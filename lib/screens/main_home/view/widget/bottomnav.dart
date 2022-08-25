import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return
     BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.messenger), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(
              icon: Container(
                height:mob ? 35.h : 30.h,
                width:mob ? 35.w :8.w,
                decoration: BoxDecoration(
                    border: context.watch<LobyProvider>().currentIndex == 4
                        ? Border.all(width: 3, color: Colors.black)
                        : Border.all(),
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image:
                       NetworkImage(
                          'https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80'),fit: BoxFit.cover
                    )),
              ),
              label: '')
        ],
        currentIndex: context.watch<LobyProvider>().currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (newIndex) {
          context.read<LobyProvider>().updateIndex(newIndex);

        },
      );
  }
}