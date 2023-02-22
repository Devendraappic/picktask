import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var response=HomePageResponse().obs;
  final client = ApiClient();

  @override
  void onInit() {
    //getHomePageData(userId??0);
    super.onInit();
  }

  Future<HomePageResponse> getHomePageData(int userId) async {
    isLoading(true);
    try {
      response.value = await client.getHomePageData(userId);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.value.msg!);
    if (response.value.status == true) {

      isLoading(false);

      return response.value;
    } else {
      isLoading(false);
      Get.snackbar(response.value.msg ?? "", "", colorText: kWhiteColor);
    }
    return response.value;
  }
}
