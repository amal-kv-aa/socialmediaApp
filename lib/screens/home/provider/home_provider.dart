import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/model/postmodel/post_model.dart';
import 'package:social_media/screens/home/model/suggetion_model/suggetion.dart';
import 'package:social_media/screens/main_home/view/widget/main_home.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/services/api/posts/posts_api.dart';
import 'package:social_media/services/api/profile/user_profile_services.dart';
import 'package:social_media/utils/user/current_user.dart';
import 'package:social_media/widgets/loading/loading.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    fetchPosts();
    getSuggetion();
  }
  List<SuggetionModel>? suggetion;

  List<dynamic> islike = [];
  List<PostModel>? posts;

  Future<void> fetchPosts() async {
    posts = await PostapiServices().getPostdatas();
    notifyListeners();
  }

//==============like==post============//

  toLike(postid, BuildContext context, List likes) {
    if (likes.contains(CurrentUser.userId)) {
      likes.remove(CurrentUser.userId);
      notifyListeners();
    } else {
      likes.add(CurrentUser.userId);
      notifyListeners();
    }

    PostapiServices().likeposts(postid)!.then((value) => {
          if (value == "success")
            {fetchPosts()}
          else
            {CustomSnackbar.showSnack(context: context, text: value)}
        });
  }

  bool checklike(List likes) {
    return likes.contains(CurrentUser.userId);
  }

  //==============postdelete========//
  toDeletepost(postid, BuildContext context) {
    Loading(context).progressbar(true);
    PostapiServices().deletePost(postid)!.then((value) {
      if (value == "success") {
        fetchPosts();
        context.read<ProfileProvider>().togetProfiledata().then((value) {
          Loading(context).progressbar(false);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) => MainHome()));
        });
      } else {
        Loading(context).progressbar(false);
        CustomSnackbar.showSnack(context: context, text: value);
      }
    });
  }

//===============getsuggetions=============//
  getSuggetion() async {
    suggetion = await ProfileServices().suggetion();
    notifyListeners();
  }

//===============follow==and==Unfollow=============//
  toFollowandUnollow(BuildContext context, String userid) {
    log(userid);
    ProfileServices().followUnfollow(userid)!.then((value) {
      if (value == "success") {
        fetchPosts();
        CustomSnackbar.showSnack(context: context, text: value);
      } else {
        CustomSnackbar.showSnack(context: context, text: value);
      }
    });
  }
}
