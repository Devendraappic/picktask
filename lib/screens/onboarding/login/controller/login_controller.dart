import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final client = ApiClient();

  @override
  void onInit() {
    super.onInit();
  }

  Future<LoginResponse> loginUser(
      BuildContext context, String username, String password) async {
    LoginResponse response = LoginResponse();
    // showProgressDialog(context);
    isLoading(true);
    try {
      response = await client.userLogin(username, password, firebaseToken??"");
    } catch (e, s) {
      print(s);
    }
    Get.back();
    debugPrint("apiResponse------->" + response.message!);
    if (response.success == true) {

      await storage.write(KeyConstants.isLoginKey, true);
      await storage.write(KeyConstants.userIdKey, response.data?.data?.id??0);
      await storage.write(KeyConstants.nameKey, response.data?.data?.name??"");
      await storage.write(KeyConstants.partnerIdKey, response.data?.data?.partnerId??"");

      await storage.write(
          KeyConstants.refCodeKey, response.data?.data?.refCode??"");
      await storage.write(KeyConstants.emailKey, response.data?.data?.email??"");

      await storage.write(KeyConstants.mobileKey, response.data?.data?.mobile??"");
      await storage.write(
          KeyConstants.profilePicKey, response.data?.data?.profilePic??"");

      await storage.write(
          KeyConstants.earningKey, response.data?.data?.earning);
      await storage.write(KeyConstants.totalWalletAmountKey,
          response.data?.data?.totalWalletAmount);
      await storage.write(KeyConstants.currentWalletAmountKey,
          response.data?.data?.currentWalletAmout);
      await storage.write(KeyConstants.accountStatusKey, response.data?.data?.status);
      await storage.write(
          KeyConstants.kycStatusKey, response.data?.kycStatus);
      print("mytoken: ${response.data?.token}");

      print("id ${response.data?.data?.id.toString()}");

      isLoading(false);

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.message ?? "");
    }
    return response;
  }
}
