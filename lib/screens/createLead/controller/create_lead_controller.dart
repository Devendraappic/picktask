import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/createLead/model/create_lead_form_model.dart';
import 'package:picktask/screens/createLead/model/lead_submit_response.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class CreateLeadController extends GetxController {
  var isLoading = false.obs;
  var formItems=<LeadFormData>[].obs;
  final client = ApiClient();



  @override
  void onInit() {

    //getTaskList("Loan/credit");
    super.onInit();
  }

  Future<CreateLeadFormResponse> createLeadForm(int jobId) async {

    var response=CreateLeadFormResponse();
    try {
      isLoading(true);
      response = await client.createLeadForm(jobId);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg!);
    if (response.status == true) {

      isLoading(false);
      formItems.value= response.data??[];

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }

  Future<LeadSubmitResponse> submitLead(int jobId, Map<String, dynamic> map, List<File> images) async {
    var response;
    try {
      isLoading(true);
      log("request data::> userId: $userId,jobId: $jobId, map: ${map.toString()}, file size: ${images.length}");
      response = await client.submitLeadRequest(userId??0, jobId, map, images);
    } catch (e, s) {
      print(s);
      isLoading(false);
    }

    if (response.status == true) {

      isLoading(false);

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
