import 'package:flutter/material.dart';
import 'package:social_media/screens/full_view/view/fullview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({Key? key,required this.postimage}) : super(key: key);
  final String postimage;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.h,
        width: 262.w,
        decoration:const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              minRadius: 20.h,
                              maxRadius: 20.h,
                              backgroundColor: Colors.black,
                              backgroundImage: const NetworkImage(
                                  'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg'),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Text(
                              'tom',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              size: 24.h,
                            ))
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 9,
              child: GestureDetector(
                onTap: (() => Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FullView(image: postimage,)))),
                child: Container(
                  decoration: BoxDecoration(
                    image:  DecorationImage(
                        image: NetworkImage(
                            postimage),
                        fit: BoxFit.cover),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Icon(Icons.telegram_outlined,size: 28.h),
                            SizedBox(
                              width: 15.w,
                            ),
                             Icon(Icons.mode_comment_outlined, size: 28.h),
                            SizedBox(
                              width: 15.w,
                            ),
                             Icon(
                              Icons.favorite_border,
                              size: 28.h
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ));
  }
}
