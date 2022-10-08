import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/provider/home_provider.dart';
import 'package:social_media/screens/home/view/widgets/posts/posts_home.dart';
import 'package:social_media/screens/home/view/widgets/suggetion/suggetion.dart';
import 'package:social_media/screens/newpost/provider/newpost_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const CustomText(
          text: "Tailus",
          fontfamily: 'cursive',
          size: 26,
          weight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.read<NewpostProvider>().chosePicker(context);
              },
              icon: const Icon(
                Icons.add_a_photo_outlined,
                color: Colors.teal,
              ))
        ],
      ),
      body: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        SizedBox(
          height: 78.h,
          width: 61.w,
          child: const Stories(color: Colors.cyan),
        ),
        SizedBox(
          height: 600.h,
          width: 200.w,
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              if (value.posts == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (value.posts!.isEmpty) {
                return  Center(
                    child: CustomText(
                  text: "Add some friends",
                  size: 25.sp,
                  fontfamily: "cursive",
                  weight: FontWeight.bold,
                ));
              }
              return RefreshIndicator(
                onRefresh: () => context.read<HomeProvider>().fetchPosts(),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.posts?.length,
                  itemBuilder: (context, index) {
                    if (index == value.posts!.length ~/ 2) {
                      return Suggetions(
                          index: index);
                    }
                    return HomePosts(
                        userDetails: value.posts?[index],
                        index: index,
                        postdata: value.posts?[index].userId);
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 200.h)
      ]),
    );
  }
}
