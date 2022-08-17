import 'package:flutter/material.dart';
import 'package:social_media/utils/enum/colors/colors.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          clipBehavior: Clip.hardEdge,
          height: size.height * 0.5,
          width: size.width * 1,
          decoration:const BoxDecoration(
            color: EnumCOlors.color,
            boxShadow:  [
              BoxShadow(
               offset: Offset(2,8),
                color: Color.fromARGB(255, 61, 61, 61),
                blurRadius: 3,
              ),
            ]
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            const CircleAvatar(
                              minRadius: 20,
                              maxRadius: 20,
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(
                                  'https://sm.askmen.com/t/askmen_in/article/f/facebook-p/facebook-profile-picture-affects-chances-of-gettin_fr3n.1200.jpg'),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            const Text(
                              'tom',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_vert))
                      ],
                    ),
                  )),
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://tse2.mm.bing.net/th?id=OIP.6oSHpOACqXDhOWP1eI7NsQHaFj&pid=Api&P=0'),
                        fit: BoxFit.contain),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.save),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            const Icon(Icons.message_outlined),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
