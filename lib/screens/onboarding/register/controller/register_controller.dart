import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/ui/otp.dart';
import 'package:picktask/screens/onboarding/register/model/register_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  final client = ApiClient();

  @override
  void onInit() {
    super.onInit();
  }

  Future<RegisterResponse> registerUser(
      BuildContext context, String name, String mobile, String email,String password, String referral) async {
    RegisterResponse response = RegisterResponse();
    // showProgressDialog(context);
    isLoading(true);
    try {
      response = await client.registerUser(name, mobile, email, password, referral,firebaseToken??"");
    } catch (e, s) {
      print(s);
    }
    Get.back();
    debugPrint("apiResponse------->" + response.message!);
    if (response.success == true) {


      isLoading(false);
      // closeDialog();
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.message ?? "");
    }
    return response;
  }
}
