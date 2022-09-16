import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/screens/chat/view/chat.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';
import 'package:social_media/widgets/text_custom/text.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    final mob = ResponsiveStyle.isMobile(context);
    return GestureDetector(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const ChatScreen())),
      child: SizedBox(
        height: 80.h,
        width: 100.w,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal:mob ? 10.w : 0.w,vertical:mob ? 5.h :0.h),
                      child: Row(
                        children: [
                          Container(
                            height: mob ? 50.h :60.h,
                            width: mob ? 50.w : 15.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(width: 1, color: Colors.white),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://tse4.mm.bing.net/th?id=OIP.XSZAFm-5JI7nriDLwZqRQQHaE7&pid=Api&P=0'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width:mob ? 20.w :2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                            const CustomText(text: 'Ronin'),
                                SizedBox(
                                  width:mob ? 140.w : 50.w,
                                  child:const Text(
                                   'hi , ho,jegfwebjtsghkewgmrnfvb,ewjgrejwbrgj4w5eurtjgwenlkjshrlfuhewrhjfku2hwe5krjfhjeww yous  ? ',
                                   style: TextStyle(color: Colors.grey),
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                               ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left:mob ? 10.w : 0, right:mob ? 30.w :3, top:mob ? 10.h : 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.message,
                            color:mob ? Colors.white : Colors.black,
                            shadows: [
                              BoxShadow(
                                  color: color,
                                  offset: const Offset(0, 4),
                                  blurRadius: 30),
                              BoxShadow(
                                  color: color,
                                  offset: const Offset(0, 4),
                                  blurRadius: 30),
                            ],
                          ),
                          const Text(
                            '3s.ago',
                            style: TextStyle(color: Color.fromARGB(253, 58, 58, 58)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
