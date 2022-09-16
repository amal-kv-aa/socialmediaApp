import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooleSignupProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool? _isSignined;
  bool get isSignined => _isSignined!;

  GooleSignupProvider() {
    _isSignined = false;
  }

  set isSignined(bool isSignined) {
    _isSignined = isSignined;
    notifyListeners();
  }
  Future login() async {
    final user = await googleSignIn.signIn();
    _isSignined = true;
     notifyListeners();
    if (user == null) {
      isSignined = false;
      return;
    } else {
    }
  }
}
