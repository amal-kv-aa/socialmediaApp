import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/full_view/view/fullview.dart';
import 'package:social_media/screens/home/provider/home_provider.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class PostsGridView extends StatefulWidget {
  const PostsGridView({Key? key, required this.length, required this.postData})
      : super(key: key);
  final int length;
  final UserDetails? postData;
  @override
  State<PostsGridView> createState() => _PostsGridViewState();
}

class _PostsGridViewState extends State<PostsGridView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<ProfileProvider>().setPMode(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileProvider>().pCount = widget.length;
    final mob = ResponsiveStyle.isMobile(context);
    if (widget.postData == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.postData!.posts.isEmpty) {
      return const Center(
        child: CustomText(
          text: "no posts",
          size: 25,
          fontfamily: "cursive",
          weight: FontWeight.bold,
        ),
      );
    }
    return RefreshIndicator(
        onRefresh: () =>context.read<HomeProvider>().fetchPosts(),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: mob ? 150.w : 50.w,
              mainAxisExtent: mob ? 150.h : 150.h),
          itemCount: widget.postData?.posts.length ?? widget.length,
          primary: false,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => FullView(
                          post: widget.postData,
                          index: index,
                        )));
              },
              child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 30,
                  shadowColor: Colors.black,
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.postData!.posts[index].image),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high),
                  ))),
            );
          }),
    );
  }
}
