import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
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
      await storage.write('is_login', true);
      await storage.write('token', response.data?.token??"");
      await storage.write('id', response.data?.data?.id??0);
      await storage.write('role', response.data?.data?.role??"");
      await storage.write('name', response.data?.data?.name??"");
      await storage.write('partner_id', response.data?.data?.partnerId??"");
      await storage.write(
          'first_name', response.data?.data?.firstName??"");
      await storage.write(
          'reffercode', response.data?.data?.refCode??"");
      await storage.write('email', response.data?.data?.email??"");
      await storage.write(
          'last_name', response.data?.data?.lastName??"");
      await storage.write('mobile', response.data?.data?.mobile??"");
      await storage.write(
          'profile_pic', response.data?.data?.profilePic??"");
      await storage.write(
          'ranking', response.data?.data?.ranking);
      await storage.write(
          'earning', response.data?.data?.earning);
      await storage.write('total_wallet_amount',
          response.data?.data?.totalWalletAmount);
      await storage.write('current_wallet_amout',
          response.data?.data?.currentWalletAmout);
      await storage.write('status', response.data?.data?.status);
      await storage.write(
          'approve', response.data?.data?.approve);
      await storage.write(
          'kyc_status', response.data?.data?.kycStatus);

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
