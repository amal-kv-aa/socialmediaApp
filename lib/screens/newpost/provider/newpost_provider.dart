import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/home/model/post_model.dart';
import 'package:social_media/screens/newpost/view/newpost.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/screens/profile/provider/profile_provider.dart';
import 'package:social_media/services/api/posts/posts_api.dart';
import 'package:social_media/services/helper/helperfunction.dart';
import 'package:social_media/utils/user/current_user.dart';
import 'package:social_media/widgets/snackbar/snackbar.dart';

class NewpostProvider with ChangeNotifier {
  NewpostProvider() {
    fetchPosts();
  }
  List<int> islike = [];
  List<PostModel>? posts ;
  File? imagepath;
  TextEditingController captionController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  chosePicker(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.white60,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      captureimage().then((value) {
                        if (value != null) {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const NewPost()));
                        } else {
                          Navigator.pop(context);
                          return;
                        }
                      });
                    },
                    icon: Icon(Icons.camera_alt_outlined,
                        color: Colors.black, size: 25.h)),
                IconButton(
                    onPressed: () {
                      imagepick().then((value) {
                        if (value != null) {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const NewPost()));
                        } else {
                          Navigator.pop(context);
                          return;
                        }
                      });
                    },
                    icon: Icon(Icons.image, color: Colors.black, size: 25.h))
              ],
            ),
          );
        });
  }

  Future imagepick() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 1080,
        maxWidth: 1080);
    if (image == null) {
      return null;
    } else {
      imagepath = File(image.path);
      return "";
    }
  }

  Future captureimage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxHeight: 1080,
        maxWidth: 1080);
    if (image == null) {
      return null;
    } else {
      imagepath = File(image.path);
      return "";
    }
  }

  topost(BuildContext context) async {
    String userid = await HelperFunction().getuserId()!;
    final postdata = UserPostModels(
        caption: captionController.text.trim(),
        image: imagepath!.path.toString(),
        userId: userid.toString());

    PostapiServices().postimages(postdata)!.then((value) {
      if (value == "success") {
        clearField();
        Navigator.pop(context);
        CustomSnackbar.showSnack(context: context, text: "post added");
        fetchPosts();
        context.read<ProfileProvider>().togetProfiledata();
      } else {
        clearField();
        CustomSnackbar.showSnack(context: context, text: value);
      }
    });
  }

  void fetchPosts() async {
    posts = await PostapiServices().getPostdatas();
    notifyListeners();
  }

  clearField() {
    captionController.clear();
    tagController.clear();
  }

  //===========like===post=======//
  toLike(postid, BuildContext context, uid) {
    PostapiServices().likeposts(postid)!.then((value) => {
          if (value == "success")
            {
              fetchPosts(),
            }
          else
            {CustomSnackbar.showSnack(context: context, text: value)}
        });
  }

  bool checklike(List likes) {
    log("ooo...${CurrentUser.userId}");
    return likes.contains(CurrentUser.userId);
  }

}
