import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/lobi/view/lobi.dart';
import 'package:social_media/screens/profile/view/widgets/posts/posts.dart';
import 'package:social_media/screens/profile/view/widgets/profile_bg_style/profile_outer.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';
import 'package:social_media/utils/enum/colors/colors.dart';
import 'package:social_media/utils/follower_styles/follow_cards.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     final value = Provider.of<Responsive>(context).device;
    return Scaffold(
      backgroundColor: EnumCOlors.color,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text("Account settings"),
                        ),
                         PopupMenuItem(
                          value: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const[
                              Text("Logout"),
                              Icon(Icons.logout_rounded,size: 20,)
                            ],
                          ),
                        )
                      ]),
            ],
            excludeHeaderSemantics: true,
            backgroundColor: Colors.transparent,
            collapsedHeight: value == 'mobile' ? size.height * 0.53 : size.height * 0.62,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    height: value == 'mobile' ?  size.height * 0.56 : size.height * 0.62,
                    width: size.width * 1,
                    color: Colors.transparent,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                width: double.infinity,
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            right: 3,
                            top: size.height * 0.2,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit))),
                        Consumer<Responsive>(
                          builder: (context, value, child) => Positioned(
                            top: value.device == 'mobile'
                                ? size.height * 0.17
                                : size.height * 0.1,
                            child: ProfileOuter(
                              image:
                                  'https://i.pinimg.com/736x/00/ec/6b/00ec6b1a19a8dd9dee3949d4f7b09c1b.jpg',
                            ),
                          ),
                        ),
                        Positioned(
                          top: value == 'mobile' ? size.height *0.31: size.height * 0.36,
                          child: Container(
                              width: size.width * 1,
                              height: size.height * 0.15,
                              color: Colors.transparent,
                              child: const FollowerCards()),
                        ),
                        Positioned(
                            top:value == 'mobile' ? size.height * 0.46 : size.height * 0.52,
                            child: Container(
                                color: Colors.transparent,
                                height: value == 'mobile' ? size.height* 0.1 : size.height * 0.1,
                                width: size.width * 1,
                                child: const Center(child: Stories(color: Colors.white,)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          context.watch<Responsive>().device == 'mobile'
              ? SliverAppBar(
                  pinned: true,
                  toolbarHeight: size.height * 0.04,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white12,
                  elevation: 4,
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(
                            Icons.grid_view_rounded,
                            color: Colors.black,
                          ),
                          Icon(
                            Icons.photo,
                            color: Colors.black,
                          ),
                        ],
                      )
                    ],
                  ),
                  titleSpacing: 0,
                )
              : const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
          const SliverToBoxAdapter(
            child: PostsGridView(),
          )
        ],
      ),
    );
  }
}
