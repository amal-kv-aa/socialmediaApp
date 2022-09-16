import 'package:flutter/material.dart';

class Loding{
 static progressbar(BuildContext context){
       showDialog(barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return
         const AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
            title: Center(
              child: CircularProgressIndicator()
        ));
        }
     );
  }
}