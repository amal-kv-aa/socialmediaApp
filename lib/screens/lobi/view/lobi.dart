import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/view/home.dart';
import 'package:social_media/screens/lobi/provider/loby_provider.dart';
import 'package:social_media/screens/profile/view/profile.dart';

class LobiScreen extends StatelessWidget {
   LobiScreen({Key? key}) : super(key: key);
   final List _pages=[const Home(),const Profile(),const Profile(),const Profile()];
  @override
  Widget build(BuildContext context) {

    return 
    Scaffold(
      body: _pages[context.watch<LobyProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.messenger), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: context.watch<LobyProvider>().currentIndex == 3
                      ? Border.all(width: 3, color: Colors.black)
                      : Border.all(),
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/00/ec/6b/00ec6b1a19a8dd9dee3949d4f7b09c1b.jpg'),
                  )),
            ),
            label: '')
      ],
      currentIndex: context.watch<LobyProvider>().currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      onTap: (newIndex) {
        context.read<LobyProvider>().updateIndex(newIndex);
        
      },
    ),
    );
  }
}
