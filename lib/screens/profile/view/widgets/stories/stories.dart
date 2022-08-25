import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal:mob ? 8.w :2.w, vertical: mob ? 6.h : 2.h),
          child: Container(
            height: 43.h,
            width: ResponsiveStyle.isMobile(context) ? 63.w : 30.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2.h, color: Colors.black),
              borderRadius: BorderRadius.circular(20.h),
              image: const DecorationImage(
                  image: NetworkImage(
                      'https://tse3.mm.bing.net/th?id=OIP.AR2L5wr4IXhioW5DQXJzKwHaFj&pid=Api&P=0'),
                  fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
