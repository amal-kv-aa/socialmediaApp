import 'package:flutter/cupertino.dart';

class Responsive with ChangeNotifier {
  String? _device;
  get device => _device;
  checkdevice(Size size) {
    if (size.width <= 650) {
      _device = "mobile";
      notifyListeners();
    } else if (size.width > 650 && size.width < 1100) {
      _device = 'tablet';
      notifyListeners();
    } else {
      _device = 'desktop';
      notifyListeners();
    }
  }
}
