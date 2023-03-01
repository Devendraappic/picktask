import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/task/model/task_detail_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/utils/color.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  var taskList=<TaskData>[].obs;
  final client = ApiClient();

  var actionButtonText= "".obs;
  var taskDetailResponse= TaskDetailResponse().obs;

  @override
  void onInit() {
    actionButtonText.value= AppStrings.txtStartEarning;
    //getTaskList("Loan/credit");
    super.onInit();
  }

  Future<TaskListResponse> getTaskList(String category) async {

    var response=TaskListResponse();
    try {
      isLoading(true);
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

  Future<TaskDetailResponse> getTaskDetail(int taskId) async {
    try {
      isLoading(true);
      // WidgetsBinding.instance.addPostFrameCallback((_)async {
      //
      // });
      taskDetailResponse.value = await client.getTaskDetails(79);

    } catch (e, s) {
      print(s);
    }
    print("apiResponse------->" + taskDetailResponse.value.msg.toString());
    if (taskDetailResponse.value.status == true) {
      isLoading(false);

      return taskDetailResponse.value;
    } else {
      isLoading(false);
      Get.snackbar(taskDetailResponse.value.msg ?? "", "",
          colorText: kWhiteColor);
    }
    return taskDetailResponse.value;
  }

}
