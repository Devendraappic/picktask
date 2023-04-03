import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_verify_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class OTPVerificationController extends GetxController {
  var isLoading = false.obs;

  final client = ApiClient();
  var start = 0.obs;


  Future<OTPResponse> sendOTP(
      BuildContext context,String mobile) async {
    OTPResponse response = OTPResponse();
    isLoading(true);
    try {
      response = await client.sendOtp( mobile, firebaseToken??"");
      isLoading(false);
    } catch (e, s) {
      print(s);
      isLoading(false);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      showToastMsg(response.msg ?? "");
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    isLoading(false);
    return response;
  }

  Future<VerifyOTPResponse> verifyOTP(
      BuildContext context, String otp, String mobile) async {
    VerifyOTPResponse response = VerifyOTPResponse();
    isLoading(true);
    try {
      response = await client.verifyOtp(otp, mobile, firebaseToken??"");
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      await storage.write(KeyConstants.isLoginKey, true);
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


      print("userid:::> ${response.data?.id.toString()}");

      isLoading(false);
      Get.offAll(HomeNav(index: 0.obs));
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
