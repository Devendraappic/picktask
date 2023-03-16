import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/account/idCard/model/idcard_response.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
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
      BuildContext context,int userId) async {
    IdCardResponse response = IdCardResponse();
    //showProgressDialog(context);
    isLoading(true);
    try {
      response = await client.getIdCardDetails(userId);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      idCardResponse(response);
      await storage.write('is_login', true);
      await storage.write('id', response.data?.id??0);
      await storage.write('role', response.data?.role??"");
      await storage.write('name', response.data?.name??"");
      await storage.write('partner_id', response.data?.partnerId??"");
      await storage.write(
          'first_name', response.data?.firstName??"");
      await storage.write(
          'reffercode', response.data?.refCode??"");
      await storage.write('email', response.data?.email??"");
      await storage.write(
          'last_name', response.data?.lastName??"");
      await storage.write('mobile', response.data?.mobile??"");
      await storage.write(
          'profile_pic', response.data?.profilePic??"");
      await storage.write(
          'ranking', response.data?.ranking);
      await storage.write(
          'earning', response.data?.earning);
      await storage.write('total_wallet_amount',
          response.data?.totalWalletAmount);
      await storage.write('current_wallet_amout',
          response.data?.currentWalletAmout);
      await storage.write('status', response.data?.status);
      await storage.write(
          'approve', response.data?.approve);
      await storage.write(
          'kyc_status', response.data?.kycStatus);


      print("id ${response.data?.id.toString()}");

      isLoading(false);
      //closeDialog();
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
