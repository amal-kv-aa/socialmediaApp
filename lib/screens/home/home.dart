import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/google_signup/provider/google.provider.dart';

class Home extends StatelessWidget {
 Home({Key? key,required this.username}) : super(key: key);
 String? username;
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text(username ?? "null"),
        actions: [ElevatedButton(onPressed: (){context.read<GooleSignupProvider>().logout().then((value) => {
        Navigator.pop(context)
      });}, child: const Text("logout"))],),
      body: Container(),
    );
    
  }
}