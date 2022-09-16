import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 10.w),
      child: Container(
        height: 70.h,
        width: 304.w,
        decoration:const BoxDecoration(
            color: Colors.white,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://tse4.mm.bing.net/th?id=OIP.XSZAFm-5JI7nriDLwZqRQQHaE7&pid=Api&P=0'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10.w,),
              const  CustomText(text: 'Ronin rquested following you',size: 10,)
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.white12), child:const Text('cancel'),),
                SizedBox(width: 10.w,),
                ElevatedButton(onPressed: (){}, child:const Text('accept')),
                SizedBox(width: 10.w,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
