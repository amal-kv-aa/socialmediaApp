import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class PostsGridView extends StatelessWidget {
  const PostsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<Responsive>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(left: size.width * 0.08, right: size.width * 0.08),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                maxCrossAxisExtent:
                    value.device == 'desktop' ? 350 : 150,
                mainAxisExtent:
                    value.device == 'desktop' ? 350 : 150),
            itemCount: 25,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.hardEdge,
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://tse3.mm.bing.net/th?id=OIP.mXVvOZA8R9jaqgWjJuQ7tQHaHa&pid=Api&P=0'),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high),
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(30))),
              );
            }),
      ),
    );
  }
}
