import 'package:flutter/cupertino.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/services/api/profile/user_profile_services.dart';

class ProfileProvider with ChangeNotifier {
ProfileProvider(){
  togetProfiledata();
}
  UserDetails ? userData;
  double? tabbarheight;
  int pCount = 0;

  setPMode(BuildContext context) {
    setTabBarViewHeight(
        context: context, childcount: pCount, crossAxisCount: 3);
  }
  setTabBarViewHeight({
    required BuildContext context,
    required int childcount,
    required int crossAxisCount,
  }) {
    double titleheight = MediaQuery.of(context).size.width / crossAxisCount;
    if (childcount == 0) return;
    if (childcount % 2 != 0) {
      childcount++;
    }
    tabbarheight = titleheight * (childcount / crossAxisCount);
    notifyListeners();
  }

 Future <void> togetProfiledata()async{
   userData = await ProfileServices().getPostdatas();
   notifyListeners();
  }
  
}
