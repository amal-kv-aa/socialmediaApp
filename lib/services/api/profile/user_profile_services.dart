import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/services/api_endpoins/api_endoints.dart';
import 'package:social_media/services/helper/helperfunction.dart';
import 'package:social_media/utils/user/current_user.dart';

class ProfileServices extends ApiEndPoints{

  Dio dio = Dio();

Future <ProfileModel?> getPostdatas() async {
    
    try {
      dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      var response =
          await dio.get("${baseUrl}user/${CurrentUser.userId}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log("succes");
        final datas = ProfileModel.fromJson(response.data);
        return datas;
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
}