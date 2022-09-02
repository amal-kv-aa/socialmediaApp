import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/login/model/model_login.dart';
import 'package:social_media/screens/otp/provider/otp_provider.dart';
import 'package:social_media/services/api_endpoins/api_endoints.dart';
import 'package:social_media/screens/sign_up/model/auth.models.dart';
import 'package:social_media/utils/snackbar/snackbar.dart';

class ApiServices extends ApiEndPoints {
  //===================sign up request==============================//
  signupRequest(User user, BuildContext context) async {
    try {
      final response =
          await Dio().post("${baseUrl}signup", data: user.tojson());
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response;
      } else 
      {
      }
    } on DioError catch (dioError) {
      networkError(dioError, context);
      CustomSnackbar.showSnack(
          context: context, text: dioError.response!.data["error"]);
    }
  }

//=========================otp verify=============================//
  otpVerify(
      {required User otpModels,
      required String otp,
      required BuildContext context}) async {
    try {
      Map data = otpModels.tojson();
      data["Otp"] = otp;
      final response = await Dio().post("${baseUrl}verifyOtp", data: data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response;
      } else {
        return;
      }
    } on DioError catch (dioError) {
      networkError(dioError, context);
      CustomSnackbar.showSnack(
          context: context, text: dioError.response!.data["error"]);

      context.read<OtpProvider>().showError(context);
    }
  }

//=========================Login=========================//
  login(LoginModel user, BuildContext context) async {
    try {
      final response =
          await Dio().post("${baseUrl}signin", data: user.tojson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response;
      } else {
        log(response.statusCode.toString());
      }
    } on DioError catch (dioError) {
      networkError(dioError, context);
      CustomSnackbar.showSnack(
          context: context, text: dioError.response!.data["error"]);
    }
  }

 //========================checking internet error=================// 
  networkError(DioError dioError,context){
    if (dioError.error.toString() ==
          'SocketException: Failed host lookup: \'tailus-api-gateway.herokuapp.com\' (OS Error: No address associated with hostname, errno = 7)') {
        CustomSnackbar.showSnack(
            context: context, text: 'Your internet not discoverable');
      }
  }
}
