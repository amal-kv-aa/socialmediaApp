import 'package:flutter/material.dart';
import 'package:social_media/screens/profile/view/widgets/stories/stories.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
    Scaffold(
     appBar: AppBar(toolbarHeight: size.height*0.1,
     automaticallyImplyLeading: false,),
     body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: size.height*0.11,
            width: size.height*1,
            child:const Stories(color: Colors.black,),
          )
        ],
      ),
     ),
   );
  }
}