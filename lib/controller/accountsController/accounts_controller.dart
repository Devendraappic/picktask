import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/model/onboarding/welcome_tab.dart';
import 'package:picktask/screens/account/model/faq_model.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/onboarding/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
class AccountsController extends GetxController{

  var actionButtonTextBankDetail= "".obs;
  var faqList = <FAQsModel>[].obs;
  var selectedDay = "Date of Birth".obs;
  @override
  void onInit() {
    actionButtonTextBankDetail.value= AppStrings.txtSubmit;
    getFaqList();
    super.onInit();
  }
  List<FAQsModel> getFaqList() {
    faqList.clear();
    faqList.add(FAQsModel(title: "Welcome to PickTask", description: "An FAQ page is one of the simplest ways to \nimprove your site and help site visitors and users."));
    faqList.add(FAQsModel(title: "Hey", description: "Your FAQ section should be seen as a constantly expanding source of value provided to your audience. It is a place where their ever-changing and growing requirements are not only met but anticipated and exceeded frequently."));

    return faqList;
  }
  openDialer(String phoneNumber) async {
    Uri callUrl = Uri.parse('tel:=$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      throw 'Could not open the dialler.';
    }
  }

   selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      var outputFormat = DateFormat('MM-dd-yyyy');
      var outputDate = outputFormat.format(picked);
      selectedDay(outputDate.toString());

    }
  }

}