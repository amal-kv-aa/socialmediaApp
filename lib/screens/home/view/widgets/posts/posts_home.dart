import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/home/model/postmodel/post_model.dart';
import 'package:social_media/screens/home/provider/home_provider.dart';

class HomePosts extends StatelessWidget {
  const HomePosts(
      {Key? key,
      required this.postdata,
      required this.index,
      required this.userDetails
      })
      : super(key: key);
  final UserId? postdata;
  final PostModel? userDetails;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 570.h,
        width: 262.w,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
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
                          backgroundImage: NetworkImage(userDetails
                                  ?.userId.avatar
                                  .toString() ??
                              'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg'),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          userDetails?.userId.fullname ?? 'tom',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 26.h,
                        ),
                        itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Text("Account settings"),
                              ),
                              PopupMenuItem(
                                value: 2,
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text("Delete post"),
                                    Icon(Icons.logout_rounded,
                                        color: Colors.black)
                                  ],
                                ),
                              )
                            ])
                  ],
                ),
              ),
            ),
            Flexible(
              child: PinchZoom(
                resetDuration: const Duration(milliseconds: 100),
                maxScale: 2.5,
                child: FadeInImage(
                    placeholder: NetworkImage(userDetails?.image ?? ""),
                    image: NetworkImage(userDetails?.image ?? "")),
              ),
            ),
            SizedBox(
              height: 100.h,
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<HomeProvider>(
                          builder: (context, value, child) {
                            return Row(
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
                                      value.toLike(postdata!.id, context,
                                          userDetails!.likes);
                                    },
                                    icon: value.checklike(userDetails!.likes) ==
                                            false
                                        ? Icon(
                                            Icons.favorite_outline,
                                            size: 28.h,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.favorite,
                                            size: 28.h,
                                            color: Colors.red,
                                          )),
                                SizedBox(
                                  width: 10.w,
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20.w),
                          userDetails!.likes.isNotEmpty
                              ? Text(
                                  "${userDetails!.likes.length.toString()}  likes",
                                  style: const TextStyle(color: Colors.black),
                                )
                              : const SizedBox(),
                          SizedBox(width: 30.w),
                          SizedBox(
                            width: 250.w,
                            child: Text(
                              userDetails?.caption ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "cursive",
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
        }
}
