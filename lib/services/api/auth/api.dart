import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:social_media/screens/google_signup/models/google_models.dart';
import 'package:social_media/screens/login/model/model_login.dart';
import 'package:social_media/services/api_endpoins/api_endoints.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/services/helper/helperfunction.dart';

class ApiServices extends ApiEndPoints {

  //===================sign up request==============================//
  Future<String>? signupRequest(User user) async {
    try {
      final response =
          await Dio().post("${authbaseUrl}signup", data: user.tojson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return done;
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")) 
      {
        return netError;
      }
      return e.response!.data['error'];
    }
    return otherError;
  }

//=========================otp verify=============================//
  Future<String>? otpVerify(
      {required User otpModels,
      required String otp}) async {
    try {
      Map data = otpModels.tojson();
      data["Otp"] = otp;
      final response = await Dio().post("${authbaseUrl}verifyOtp", data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        String token  =  response.data['encryptToken'];
        String userId =  response.data['id'];
        HelperFunction().setAccesstocken(token);
        HelperFunction().setuserId(userId);
        return done;
      }
    } on DioError catch (e) {
      if (e.message.startsWith("SocketException")){
        return netError;
      }
      return e.response!.data['error'];
    }
    return otherError;
  }

//=========================Login===================//
 Future <String>? login(LoginModel user) async {
    try {
      final response =
          await Dio().post("${authbaseUrl}signin", data: user.tojson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(done);
        String token =  response.data['encryptToken'];
        String userId =  response.data['id'];
        HelperFunction().setAccesstocken(token);
        HelperFunction().setuserId(userId);

        return done;
      }
    } on DioError catch (e) {
     if (e.message.startsWith("SocketException")) {
        return netError;
      }
      return e.response!.data['error'];
    }
    return otherError;
  }
 //=======================googleSignup======================//
 Future<String>? googleSignIn(GoogleModel accountData)async
 {
   try {
    log("enter");
      final response =
          await Dio().post("${authbaseUrl}googleSignup", data: accountData.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        String token =  response.data['encryptToken'];
        String userId =  response.data['id'];
        HelperFunction().setAccesstocken(token);
        HelperFunction().setuserId(userId);
        return done;
      }
    } on DioError catch (e) {
     if (e.message.startsWith("SocketException")) {
        return netError;
      }
      log(e.message);
      return e.response!.data['error'];
    }
    return otherError;
  }
}