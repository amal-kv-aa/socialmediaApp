import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/model/suggetion_model/suggetion.dart';
import 'package:social_media/screens/login/view/login.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/screens/profile/view/widgets/profile_bg_style/profile_outer.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:social_media/screens/usersprofile/view/widget/gridview.dart';
import 'package:social_media/services/helper/helperfunction.dart';
import 'package:social_media/widgets/follower_styles/follow_cards.dart';
import 'package:social_media/widgets/text_custom/text.dart';

import '../../google_signup/provider/google.provider.dart';

class UsersScreen extends StatefulWidget {
   UsersScreen({Key? key,required this.userData}) : super(key: key);
   SuggetionModel? userData;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> with SingleTickerProviderStateMixin{
   late TabController tabController;
   @override
     void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body: 
      DefaultTabController(
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
                              HelperFunction().deleteAccestoken().then((value) {
                                context.read<GooleSignupProvider>().logout();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const Login()));
                              });
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
              collapsedHeight: 380.h ,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal:10.w ),
                      child: Row(
                        children: [
                          ProfileOuter(
                            image: widget.userData?.avatar,
                          ),
                          SizedBox(width: 10.w ),
                          SizedBox(
                            height: 70.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: widget.userData?.fullname ?? 'unKnown',
                                  weight: FontWeight.bold,
                                  size: 20,
                                ),
                                Center(
                                    child: CustomText(
                                  text: widget.userData?.bio ?? "..",
                                  size: 14,
                                  weight: FontWeight.bold,
                                )),
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
                        child: FollowerCards(
                          data:  widget.userData,
                        ),
                      ),
                    ),
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
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 25.h ,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 4,
              title: TabBar(
                  controller: tabController,
                  indicatorColor: const Color.fromARGB(255, 73, 73, 73),
                  indicatorWeight: 5,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  labelColor: Colors.black,
                  tabs: const [
                    Icon(Icons.photo, color: Colors.black),
                    Icon(Icons.grid_view_rounded, color: Colors.black),
                  ]),
            ),
            SliverToBoxAdapter(
                child: Container(
              color: Colors.white,
              height: context.watch<ProfileProvider>().tabbarheight ?? 0,
              child: TabBarView(controller: tabController, children: [
                GridViewPosts(
                  postData: widget.userData,
                  length: 20,
                ),
                GridViewPosts(
                  postData:widget.userData,
                  length: 20,
                )
              ]),
            ))
          ],
        ),
      ),
    );
  }
}