import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:social_media/screens/home/model/suggetion_model/suggetion.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/services/api_endpoins/api_endoints.dart';
import 'package:social_media/services/helper/helperfunction.dart';
import 'package:social_media/utils/user/current_user.dart';

class ProfileServices extends ApiEndPoints {
  Dio dio = Dio();

  Future<UserDetails?> getPostdatas() async {
    try {
      dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      var response = await dio.get("${baseUrl}user/${CurrentUser.userId}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log("go");
        final datas = UserDatas.fromJson(response.data);
        log("end");
        log(datas.userDetails.following.toString());
        return datas.userDetails;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.message.startsWith("SocketException")) {
          return null;
        }
        log("error");
        return e.response!.data['msg'];
      }
    }
    return null;
  }
 //=====================suggetionList===============//
 Future <List<SuggetionModel>?> suggetion() async {
    try {
      log("entered");
       dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      final response =
          await dio.get("${baseUrl}user/suggestion/${CurrentUser.userId}", );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log("ok");
        final userData = suggetionModelFromJson(response.data);
      log("successsss");
        return userData;
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log(e.message);
        return null;
      }
      log(e.message);
      return e.response!.data['error'];
    }
    return null;
  }
  //=========================toFollowUser=================//
  Future <String>? followUnfollow(String userid)async{
    try {
      log("...");
       dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      final response =
          await dio.put("${baseUrl}user/follow/$userid",data: {"userId" : CurrentUser.userId} );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        
      log("success");
        return response.data["message"];
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) {
        log(e.message);
        return netError;
      }
      log(e.message);
      return e.response!.data['error'];
    }
    return otherError;
  }
  }

