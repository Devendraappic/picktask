import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  var taskList=<TaskData>[].obs;
  final client = ApiClient();

  var actionButtonText= "".obs;

  @override
  void onInit() {
    actionButtonText.value= AppStrings.txtStartEarning;
    super.onInit();
  }

  Future<TaskListResponse> getTaskList(String category) async {
    isLoading(true);
    var response=TaskListResponse();
    try {
      response = await client.getTasks(category);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg!);
    if (response.status == true) {

      isLoading(false);
      taskList.value= response.data??[];

      return response;
    } else {
      isLoading(false);
      Get.snackbar(response.msg ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }
}
