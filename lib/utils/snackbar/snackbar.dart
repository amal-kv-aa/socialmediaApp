import 'package:flutter/material.dart';

class CustomSnackbar{
 static  showSnack({required BuildContext context,required String text}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text),
      backgroundColor: Theme.of(context).primaryColor,
      duration:const Duration(seconds: 3),
      ),
      
    );
  }
}