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

class ReferAndEarnController extends GetxController {
  var isLoading = false.obs;

  var myRefrerId="".obs;

  final client = ApiClient();
  var referralList=<ReferUserData>[].obs;
  @override
  void onInit() {
    myRefrerId(referCode);
    super.onInit();
  }

  Future<MyReferalResponse> getMyReferals(
      BuildContext context,int userId) async {
    MyReferalResponse response = MyReferalResponse();
    //showProgressDialog(context);
    isLoading(true);
    try {
      response = await client.getMyReferals(userId);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      myRefrerId(response.selfrefid);
      referralList.value= response.data??[];

      isLoading(false);
      //closeDialog();
      return response;
    } else {
      isLoading(false);
      //closeDialog();
      Get.snackbar(response.msg ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }
}
