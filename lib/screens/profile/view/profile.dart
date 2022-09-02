import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/profile/view/widgets/posts/posts.dart';
import 'package:social_media/screens/profile/view/widgets/profile_bg_style/profile_outer.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:social_media/utils/follower_styles/follow_cards.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/utils/text_custom/text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [
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
                            onTap: () {
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Logout"),
                                Icon(Icons.logout_rounded, color: Colors.black)
                              ],
                            ),
                          )
                        ]),
              ],
              excludeHeaderSemantics: true,
              backgroundColor: Colors.transparent,
              collapsedHeight: mob ? 380.h : 450.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: mob ? 10.w : 15),
                      child: Row(
                        children: [
                          const ProfileOuter(
                            image:
                                'https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
                          ),
                          SizedBox(width: mob ? 10.w : 20.w),
                          SizedBox(
                            height: 70.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Ronin',
                                  weight: FontWeight.bold,
                                  size: 20,
                                ),
                                Container(
                                  height: 30.h,
                                  width: mob ? 220.w : 60.w,
                                  color:
                                      const Color.fromARGB(255, 168, 168, 168),
                                  child: const Center(
                                      child: CustomText(
                                    text: 'Edit Profile',
                                    size: 14,
                                    weight: FontWeight.bold,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: Container(
                            width: double.infinity,
                            height: 90.h,
                            color: Colors.transparent,
                            child: const FollowerCards())),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomText(text: 'Stroy Hilghlights'),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 80.h,
                      child: const Stories(color: Colors.white),
                    ),
                    SizedBox(
                      height: mob ? 0.h : 20.h,
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: mob ? 25.h : 30.h,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 4,
              title: Column(
                children: [
                  TabBar(
                      indicatorColor: const Color.fromARGB(255, 73, 73, 73),
                      indicatorWeight: mob ? 5 : 10,
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      labelColor: Colors.black,
                      tabs: const [
                        Icon(Icons.photo, color: Colors.black),
                        Icon(Icons.grid_view_rounded, color: Colors.black),
                      ]),
                ],
              ),
              titleSpacing: 0,
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const TabBarView(children: [
                PostsGridView(
                  image:
                      'https://tse3.mm.bing.net/th?id=OIP.gOZoSB7g6U1GN8SK5J4chgHaGv&pid=Api&P=0',
                ),
                PostsGridView(
                  image: '',
                )
              ]),
            ))
          ],
        ),
      ),
    );
  }
}
