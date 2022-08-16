import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/utils/responsive/responsive.dart';

class FollowerCards extends StatelessWidget {
  const FollowerCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height:  size.height * 0.13,
          width:
          //context.watch<Responsive>().device == 'mobile' ?
            size.width * 0.3 ,
          //size.height*0.25,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Following'), Text('1004')],
          ),
        ),
        Container(
          height: size.height * 0.1,
         // width: context.watch<Responsive>().device == 'mobile' ? size.width * 0.25 : size.height*0.18,
          width: size.width*0.25,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Text('Posts'), Text('16')],
          ),
        ),
        Container(
          height: size.height * 0.13,
          //width: context.watch<Responsive>().device == 'mobile' ?  size.width * 0.3 : size.height*0.25,
          width: size.width*0.3,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              verticalDirection: VerticalDirection.down,
              direction: Axis.vertical,
              children: const [Text('Follwers'), Text('3666')],
            ),
          ),
        )
      ],
    );
  }
}
