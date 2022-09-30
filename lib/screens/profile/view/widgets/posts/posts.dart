
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/full_view/view/fullview.dart';
import 'package:social_media/screens/newpost/provider/newpost_provider.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class PostsGridView extends StatefulWidget {
  const PostsGridView({Key? key, required this.length,required this. post})
      : super(key: key);
  final int length;
 final List <CurrentUserPost>? post;
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
    log(widget.post![0].image.toString());
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: mob ? 150.w : 50.w,
            mainAxisExtent: mob ? 150.h : 150.h),
        itemCount:widget.post?.length ?? widget.length,
        primary: false,
        itemBuilder: (context, index) {
          if (widget.post?[index].image == null) {
            const CircularProgressIndicator();
          } 
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => FullView(

                        image: widget.post![index].image,
                      )));
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 30,
              shadowColor: Colors.black,
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.post![index].image),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
              )),
            ),
          );
        });
  }
}
