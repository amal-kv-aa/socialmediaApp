import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/view/widgets/posts/posts_home.dart';
import 'package:social_media/screens/newpost/provider/newpost_provider.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          physics:  const BouncingScrollPhysics(),
          children: [
          SizedBox(
            height: 78.h,
            width: 61.w,
            child: const Stories(
              color: Colors.cyan,
            ),
          ),
          SizedBox(
            height: 750.h,
            width: 200.w,
            child: Consumer<NewpostProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: value.posts?.length,
                  itemBuilder: (context, index) {
                    return HomePosts(index: index,
                      postdata: value.posts?[index]
                    );
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
