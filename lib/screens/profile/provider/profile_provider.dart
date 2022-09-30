import 'package:flutter/cupertino.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/services/api/profile/user_profile_services.dart';

class ProfileProvider with ChangeNotifier {
ProfileProvider(){
  togetProfiledata();
}
  ProfileModel ? userData ;
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
   // log("full : ${MediaQuery.of(context).size.width.toString()}");
    double titleheight = MediaQuery.of(context).size.width / crossAxisCount;
    if (childcount == 0) return;
   // log("title : ${titleheight.toString()}");
    if (childcount % 2 != 0) {
      childcount++;
    }
    // log("childcount : ${childcount.toString()}");
    // log(" croxaxix: ${crossAxisCount.toString()}");
    tabbarheight = titleheight * (childcount / crossAxisCount);
    // log("tabbarheight : ${tabbarheight.toString()}");
    notifyListeners();
  }

  togetProfiledata()async{
   userData = await ProfileServices().getPostdatas();
   notifyListeners();
  }

}
