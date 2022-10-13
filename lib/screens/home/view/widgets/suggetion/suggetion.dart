import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/provider/home_provider.dart';
import 'package:social_media/screens/home/view/widgets/posts/posts_home.dart';
import 'package:social_media/screens/usersprofile/view/user_screen.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class Suggetions extends StatelessWidget {
  const Suggetions({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: HomePosts(
                  postdata: value.posts![index].userId,
                  index: index,
                  userDetails: value.posts![index])),
          value.suggetion!.isEmpty
              ? const SizedBox()
              : SizedBox(
                  height: 190.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.suggetion!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => UsersScreen(
                                      userData: value.suggetion![index]))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                  height: 190.h,
                                  width: 140.w,
                                  decoration: const BoxDecoration(
                                      color:
                                          Color.fromARGB(255, 220, 218, 218)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              value.suggetion![index].avatar),
                                        ),
                                      ),
                                      CustomText(
                                          text:
                                              value.suggetion![index].fullname),
                                      ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<HomeProvider>()
                                                .toFollowandUnollow(context,
                                                    value.suggetion![index].id);
                                          },
                                          child: const Text("Follow"))
                                    ],
                                  )),
                            ),
                          ),
                        );
                      })),
        ],
      );
    });
  }
}
