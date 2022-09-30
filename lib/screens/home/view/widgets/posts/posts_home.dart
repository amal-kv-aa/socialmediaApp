import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/home/model/post_model.dart';
import 'package:social_media/screens/newpost/provider/newpost_provider.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({Key? key, required this.postdata, required this.index})
      : super(key: key);
  final PostModel? postdata;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 550.h,
        width: 262.w,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
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
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(postdata!.image),
                        fit: BoxFit.fitWidth),
                    color: Colors.white),
              ),
            ),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.telegram_outlined, size: 28.h),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Icon(Icons.mode_comment_outlined, size: 28.h),
                                SizedBox(
                                  width: 15.w,
                                ),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<NewpostProvider>()
                                          .toLike(postdata!.id, context, index);
                                    },
                                    icon: Icon(
                                      context
                                                  .watch<NewpostProvider>()
                                                  .checklike(postdata!.likes) ==
                                              false
                                          ? Icons.favorite_border
                                          : Icons.favorite,
                                      size: 28.h,
                                      color: Colors.red,
                                    )),
                                SizedBox(
                                  width: 10.w,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.w,
                          ),
                          postdata!.likes.isNotEmpty
                              ? Text(
                                  "${postdata!.likes.length.toString()}  likes",
                                  style: const TextStyle(color: Colors.black),
                                )
                              : const SizedBox()
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
