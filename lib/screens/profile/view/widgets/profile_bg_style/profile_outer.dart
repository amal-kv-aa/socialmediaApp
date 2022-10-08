import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class ProfileOuter extends StatelessWidget {
  const ProfileOuter({Key? key, this.image}) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return Container(
      height: mob ? 110.h :130.h,
      width:mob ? 110.w :30.w,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(60),
        image:image != null ? DecorationImage(
            image:
                 NetworkImage(image!)  ,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high)
            :
             const DecorationImage(
            image:
                 AssetImage("assets/images/avatar-1-1536x1536.jpeg")  ,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high)
      ),
    );
  }
}
