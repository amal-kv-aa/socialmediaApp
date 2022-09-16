import 'package:flutter/material.dart';
import 'package:social_media/screens/home/view/widgets/Posts/posts_home.dart';
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
              onPressed: () {},
              icon: const Icon(
                Icons.add_a_photo_outlined,
                color: Colors.teal,
              ))
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(children: [
          SizedBox(
            height: 78.h,
            width: 61.w,
            child: const Stories(
              color: Colors.cyan,
            ),
          ),
          const
           HomePosts(
              postimage:
                  'https://tse3.mm.bing.net/th?id=OIP.AR2L5wr4IXhioW5DQXJzKwHaFj&pid=Api&P=0'
                  ),
          const
           HomePosts(
              postimage:
                  'https://tse3.mm.bing.net/th?id=OIP.AR2L5wr4IXhioW5DQXJzKwHaFj&pid=Api&P=0'
                  ),
          const
           HomePosts(
            postimage:
                'https://tse3.mm.bing.net/th?id=OIP.AR2L5wr4IXhioW5DQXJzKwHaFj&pid=Api&P=0',
          )
        ]),
      ),
    );
  }
}
