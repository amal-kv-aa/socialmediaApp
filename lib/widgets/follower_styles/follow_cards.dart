import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class FollowerCards extends StatelessWidget {
  const FollowerCards({Key? key,required this.data}) : super(key: key);
  final OtherDetails? data; 
  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100.h ,
          width:mob ? 100.w : 40.w,
          decoration: BoxDecoration(
            color:  Colors.teal,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text('Following',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text(data?.following.length.toString() ?? "null",
                  style: const TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        Container(
          height: 80.h,
          width:mob ? 80.w : 30.w,
          decoration: BoxDecoration(
            color:Colors.teal,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Posts',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text('0',
                  style: TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        Container(
          height: 100.h,
          width:mob ? 100.w : 40.w,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              verticalDirection: VerticalDirection.down,
              direction: Axis.vertical,
              children:  [
                const Text('Follwers',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Text(data?.followers.length.toString() ?? '2',
                    style: const TextStyle(
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
