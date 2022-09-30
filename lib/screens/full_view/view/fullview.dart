import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullView extends StatelessWidget {
  const FullView({Key? key, required this.image}) : super(key: key);
  final String  image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 600.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10.w),
                              const CircleAvatar(
                                minRadius: 20,
                                maxRadius: 20,
                                backgroundImage: NetworkImage(
                                    'https://tse3.mm.bing.net/th?id=OIP.QVMM2UDR8RNepSaTM1a8fQHaIa&pid=Api&P=0'),
                              ),
                              SizedBox(width: 20.w),
                              const Text("ronin")
                            ],
                          ),
                          PopupMenuButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black,
                            ),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Text('mssmd'),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Text('sdksk'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.save_outlined,
                                size: 26,
                                color: Colors.black,
                              )),
                          Row(
                            children: [
                              SizedBox(width: 10.w),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.telegram,
                                    size: 26,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.messenger_outline_sharp,
                                    size: 26,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                    size: 26,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://tse4.mm.bing.net/th?id=OIP.XSZAFm-5JI7nriDLwZqRQQHaE7&pid=Api&P=0'),
                  maxRadius: 10,
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Expanded(child: Text('liked ronin and 30 others..')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
