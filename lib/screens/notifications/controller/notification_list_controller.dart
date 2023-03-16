import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class NotificationListController extends GetxController {
  var isLoading = false.obs;
  var notificationList=<NotificationItemData>[].obs;
  final client = ApiClient();

  Future<NotificationListResponse> getNotificationList() async {
    isLoading(true);
    var response=NotificationListResponse();
    try {
      response = await client.getNotificationLIst(userId??0);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg!);
    if (response.status == true) {

      isLoading(false);
      notificationList.value= response.data??[];

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }
}
