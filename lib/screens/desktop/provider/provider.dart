import 'package:flutter/cupertino.dart';
import 'package:social_media/screens/desktop/view/desktop.dart';
import 'package:social_media/screens/login/view/login.dart';

class DesktopProvider with ChangeNotifier{
 bool  islarge = false;
  Widget firstScreen = const Login();
  Widget secondScreen =const IntroImage();
  bool showSearch = false;
updateWidgetFirst(Widget newScreen){
  firstScreen = newScreen;
}
updateWidgetSeconde(Widget newScreen){
  secondScreen = newScreen;
}
updateSize(bool value)
{
 islarge = value;
 notifyListeners();
}
searchshowUpdate(bool value){
  showSearch = value;
  notifyListeners();
}
}