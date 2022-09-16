import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/full_view/view/fullview.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class PostsGridView extends StatefulWidget {
  const PostsGridView({Key? key, required this.image, required this.length})
      : super(key: key);
  final String image;
  final int length;
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
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: mob ? 150.w : 50.w,
            mainAxisExtent: mob ? 150.h : 150.h),
        itemCount: widget.length,
        primary: false,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => FullView(
                        image: widget.image,
                      )));
            },
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 30,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
              )),
            ),
          );
        });
  }
}
