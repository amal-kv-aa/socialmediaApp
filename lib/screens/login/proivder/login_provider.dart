import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool isTaped = false;
  changecolor(bool taped) {
    isTaped = taped;
    notifyListeners();
  }
}
