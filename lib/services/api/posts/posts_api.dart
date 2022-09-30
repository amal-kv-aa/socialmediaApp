import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:social_media/screens/home/model/post_model.dart';
import 'package:social_media/screens/profile/models/usermodel.dart';
import 'package:social_media/services/api_endpoins/api_endoints.dart';
import 'package:social_media/services/helper/helperfunction.dart';

class PostapiServices extends ApiEndPoints {
  //========================add==user==posts=================//
  Dio dio = Dio();

  Future<String>? postimages(UserPostModels userdata) async {
    try {
      String fileName = userdata.image.split('/').last;
      String format = fileName.split('.').last;
      log('id${userdata.userId}');
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(userdata.image,
            filename: fileName, contentType: MediaType('image', format)),
        "caption": userdata.caption,
        'userId': userdata.userId
      });
      dio.options.contentType = 'multipart/form-data';
      dio.options.headers['Content-Type'] = 'multipart/form-data';
      dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      var response = await dio.post('${baseUrl}post', data: formData);
      if (response.statusCode! >= 200 && response.statusCode! < 300) 
      {
        log(response.data.toString());
        return done;
      }
    } catch (e) {
      if (e is DioError) {
        log(e.message);
        if (e.message.startsWith("SocketException")) {
          return netError;
        }
        log(e.message);
        return e.response!.data['msg'];
      }
    }
    return otherError;
  }

  Future<List<PostModel>?> getPostdatas() async {
    final userId = await HelperFunction().getuserId();
    try {
      dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      var response =
          await dio.get("${baseUrl}post/timeline/${userId.toString()}");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return getPostModelFromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.message.startsWith("SocketException")) {
          return null;
        }
        return e.response!.data['msg'];
      }
    }
    return null;
  }

//=============================like============================//

  Future<String>? likeposts(postid) async {
    try {
      final userId = await HelperFunction().getuserId();
      dio.options.headers["authtoken"] = await HelperFunction().getAccestoken();
      var response = await dio
          .put("${baseUrl}post/like/$postid", data: {"userId": userId});
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return done;
      }
    } catch (e) {
      if (e is DioError) {
        if (e.message.startsWith("SocketException")) {
          return netError;
        }
        return e.response!.data['msg'];
      }
    }
    return otherError;
  }
}
