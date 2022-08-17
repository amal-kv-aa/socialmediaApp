import 'package:flutter/material.dart';
import 'package:social_media/utils/enum/colors/colors.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({Key? key,required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: size.height * 0.11,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: EnumCOlors.color),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const[
                BoxShadow(
                color: Colors.black,
                blurRadius: 6,
                offset: Offset(8,10))
              ]
              ),
          child: Card(
            margin: EdgeInsets.zero,
            color: Colors.teal,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: size.width*0.3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(160),
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(20)),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: size.width*0.1, top: size.height*0.01),
                      child: Container(
                        height: size.height*0.1,
                        width: size.width*0.25,
                        decoration: BoxDecoration(
                            color: EnumCOlors.color,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.elliptical(350, 350),
                                bottomRight: Radius.elliptical(350, 350),
                                topLeft: Radius.elliptical(250, 250),
                                topRight: Radius.elliptical(250, 250)),
                            border:
                                Border.all(width: 1, color: Colors.white),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://tse4.mm.bing.net/th?id=OIP.XSZAFm-5JI7nriDLwZqRQQHaE7&pid=Api&P=0'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                     Padding(
                      padding:const EdgeInsets.only(right: 30),
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                        shadows: [
                          BoxShadow(
                              color:color,
                              offset:const Offset(0,4),
                              blurRadius: 30),
                              BoxShadow(
                              color:color,
                              offset:const Offset(0,4),
                              blurRadius: 30),BoxShadow(
                              color:color,
                              offset:const Offset(0,4),
                              blurRadius: 30)
                        ],
                      ),
                    )
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
