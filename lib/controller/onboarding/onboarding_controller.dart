import 'dart:convert';

import 'package:get/get.dart';
import 'package:picktask/main.dart';
import 'package:picktask/model/onboarding/welcome_tab.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/account/kycDetails/ui/bank_detail.dart';
import 'package:picktask/screens/onboarding/otpVerification/ui/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:http/http.dart' as http;

class OnboardingController extends GetxController {
  RxBool isLoading = false.obs;
  var welcomeList=<WelcomeModel>[].obs;
  var activeIndex = 0.obs;

  List<WelcomeModel> getWelcomeScreenData() {
    welcomeList.clear();
    welcomeList.add(WelcomeModel("Welcome to PickTask",
        "We can't wait for you to join us.", "assets/images/welcometab_two.png"));
    welcomeList.add(WelcomeModel(
        "Become an Entrepreneur!",
        "Start your business with zero investment and eran upto ₹1 Lakh montly.",
        "assets/images/welcometab_three.png"));
    welcomeList.add(WelcomeModel(
        "Indias top leading brands",
        "40+ Indian leading brands and counting.",
        "assets/images/welcometab_one.png"));

    return welcomeList;
  }
  setActiveDot(index) {
    activeIndex(index) ;
  }
}

