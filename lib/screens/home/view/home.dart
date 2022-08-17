import 'package:flutter/material.dart';
import 'package:social_media/screens/home/view/widgets/Posts/posts_home.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
           
            SizedBox(
              height: size.height * 0.11,
              width: size.width * 1,
              child: const Stories(
                color: Colors.cyan,
              ),
            ),
              const HomePosts(),
              const HomePosts(),
              const HomePosts()
          
          ]
        ),
      ),
    );
  }
}
