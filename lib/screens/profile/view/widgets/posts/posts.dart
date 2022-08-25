import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/full_view/view/fullview.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class PostsGridView extends StatelessWidget {
  const PostsGridView({Key? key,required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
   final mob = ResponsiveStyle.isMobile(context);
    return Padding(
      padding:
          EdgeInsets.only(left:0.w, right: 0.w),
      child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3.0,
              maxCrossAxisExtent:mob ? 150.w :50.w,
              mainAxisExtent:mob ? 150.w :150.h),
          itemCount: 35,
          // shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) =>  FullView(image: image,)));
              },
              child: Card(
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Container(
                    decoration: BoxDecoration(
                        image:  DecorationImage(
                            image: NetworkImage(
                                image),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high),
                       )),
              ),
            );
          }),
    );
  }
}
