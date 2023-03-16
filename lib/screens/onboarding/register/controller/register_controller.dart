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
    isLoading(true);
    try {
      response = await client.registerUser(name, mobile, email, password, referral,firebaseToken??"");
    } catch (e, s) {
      print(s);
    }
    Get.back();
    if (response.success == true) {

      await storage.write('is_login', true);
      await storage.write('id', response.data?.userData?.id??0);
      await storage.write('role', response.data?.userData?.role??"");
      await storage.write('name', response.data?.userData?.name??"");
      await storage.write('partner_id', response.data?.userData?.partnerId??"");
      await storage.write(
          'first_name', response.data?.userData?.firstName??"");
      await storage.write(
          'reffercode', response.data?.userData?.refCode??"");
      await storage.write('email', response.data?.userData?.email??"");
      await storage.write(
          'last_name', response.data?.userData?.lastName??"");
      await storage.write('mobile', response.data?.userData?.mobile??"");
      await storage.write(
          'profile_pic', response.data?.userData?.profilePic??"");
      await storage.write(
          'ranking', response.data?.userData?.ranking);
      await storage.write(
          'earning', response.data?.userData?.earning);
      await storage.write('total_wallet_amount',
          response.data?.userData?.totalWalletAmount);
      await storage.write('current_wallet_amout',
          response.data?.userData?.currentWalletAmout);
      await storage.write('status', response.data?.userData?.status);
      await storage.write(
          'approve', response.data?.userData?.approve);
      await storage.write(
          'kyc_status', response.data?.userData?.kycStatus);


      isLoading(false);

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.message ?? "");
    }
    return response;
  }
}
