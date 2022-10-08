import 'dart:developer';

import 'package:flutter/material.dart';

class Loading {
  BuildContext context;
  Loading(this.context);
  void progressbar(bool show) {
    if (show == true) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: const AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Center(child: CircularProgressIndicator())),
            );
          });
    } else {
      Navigator.pop(context);
    }
  }
}

// class Indecator extends StatelessWidget {
//   const Indecator({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return 
    
//   }
// }



      



