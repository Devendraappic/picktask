import 'dart:developer';

import 'package:get/get.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/approvedTasks/model/approved_task_response.dart';
import 'package:picktask/screens/leads/model/filter_model.dart';
import 'package:picktask/screens/leads/model/lead_detail_response.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/utils/color.dart';

import '../../../utils/local_storage.dart';

class ApprovedTasksController extends GetxController {
  var isLoading = false.obs;

  var taskList = <ApprovedTaskData>[].obs;

  final client = ApiClient();




  Future<ApprovedTasksResponse> getApprovedTasksList() async {
    print("apiCall");
    var response = ApprovedTasksResponse();
    try {
      isLoading(true);
      response =
          await client.getApprovedTaskList(/*userId??0*/ 183);
    } catch (e, s) {
      print(s);
    }
   // print("apiResponse------->" + response.msg!);
    if (response.status == true) {
      isLoading(false);
      taskList.value = response.data ?? [];

      return response;
    } else {
      isLoading(false);
      //Get.snackbar(response.msg ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }

}
