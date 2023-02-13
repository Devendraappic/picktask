import 'dart:convert';

import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/model/onboarding/welcome_tab.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/onboarding/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:http/http.dart' as http;

class AccountsController extends GetxController{

  var actionButtonText= "".obs;

  @override
  void onInit() {
    actionButtonText.value= AppStrings.txtVerify;
    super.onInit();
  }
}