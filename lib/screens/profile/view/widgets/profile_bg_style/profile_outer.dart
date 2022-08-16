import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class ProfileOuter extends StatelessWidget {
   ProfileOuter({Key? key, this.image}) : super(key: key);
  String? image;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return
    Consumer<Responsive>(
      builder: (context, value, child) =>
        Container(
        height:
        value.device == 'mobile' ?  
        120 :
         180 ,
         width: 
        value.device == 'mobile' ?   120 : 
        180,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(width: 3,color: Colors.white),
          borderRadius: BorderRadius.circular(60),
          image: DecorationImage(image:  NetworkImage( image ?? 'assets/images/avatar-1-1536x1536.jpeg'),fit: BoxFit.contain,filterQuality: FilterQuality.high),
        ),
      )
     );
  }
}