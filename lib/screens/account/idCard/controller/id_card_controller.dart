import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/account/idCard/model/idcard_response.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class IdCardController extends GetxController {
  var isLoading = false.obs;

  final client = ApiClient();
 var idCardResponse= IdCardResponse().obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<IdCardResponse> getIdCardDetail(
      BuildContext context) async {
    IdCardResponse response = IdCardResponse();
    //showProgressDialog(context);
    isLoading(true);
    try {
      response = await client.getIdCardDetails(userId??0);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      idCardResponse(response);

      await storage.write(KeyConstants.userIdKey, response.data?.id??0);
      await storage.write(KeyConstants.nameKey, response.data?.name??"");
      await storage.write(KeyConstants.partnerIdKey, response.data?.partnerId??"");

      await storage.write(
          KeyConstants.refCodeKey, response.data?.refCode??"");
      await storage.write(KeyConstants.emailKey, response.data?.email??"");

      await storage.write(KeyConstants.mobileKey, response.data?.mobile??"");
      await storage.write(
          KeyConstants.profilePicKey, response.data?.profilePic??"");

      await storage.write(
          KeyConstants.earningKey, response.data?.earning);
      await storage.write(KeyConstants.totalWalletAmountKey,
          response.data?.totalWalletAmount);
      await storage.write(KeyConstants.currentWalletAmountKey,
          response.data?.currentWalletAmout);
      await storage.write(KeyConstants.accountStatusKey, response.data?.status);
      await storage.write(
          KeyConstants.kycStatusKey, response.data?.kycStatus);



      print("id ${response.data?.id.toString()}");

      isLoading(false);
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
