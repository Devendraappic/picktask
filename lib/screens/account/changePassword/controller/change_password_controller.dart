import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/account/idCard/model/idcard_response.dart';
import 'package:picktask/screens/account/referAndEarn/model/refer_and_earn_response.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/utils.dart';

import '../../../../utils/local_storage.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;

  final client = ApiClient();
  @override

  Future<dynamic> changePassword(
      BuildContext context,int userId, String oldPassword, String newPassword) async {

    var response;
    isLoading(true);
    try {
      response = await client.changePassword(userId,oldPassword, newPassword );
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      showToastMsg(response.msg ?? "");

      isLoading(false);
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
