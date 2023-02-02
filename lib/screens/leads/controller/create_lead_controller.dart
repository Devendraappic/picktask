import 'dart:convert';

import 'package:get/get.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/onboarding/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:http/http.dart' as http;

class CreateLeadController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVerifyLoading = false.obs;


}
