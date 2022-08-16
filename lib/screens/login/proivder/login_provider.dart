import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  bool isTaped = false;
  changecolor(bool taped) {
    isTaped = taped;
    notifyListeners();
  }
}
