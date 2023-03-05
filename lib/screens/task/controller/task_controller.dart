import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/task/model/apply_job_response.dart';
import 'package:picktask/screens/task/model/task_detail_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/local_storage.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  var taskList = <TaskData>[].obs;
  final client = ApiClient();

  var taskDetailResponse = TaskDetailResponse().obs;

  @override
  void onInit() {
    //getTaskList("Loan/credit");
    super.onInit();
  }

  Future<TaskListResponse> getTaskList(String category) async {
    var response = TaskListResponse();
    try {
      isLoading(true);
      response = await client.getTasks(category);
    } catch (e, s) {
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg!);
    if (response.status == true) {
      isLoading(false);
      taskList.value = response.data ?? [];

      return response;
    } else {
      isLoading(false);
      Get.snackbar(response.msg ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }

  Future<TaskDetailResponse> getTaskDetail(int taskId) async {
    isLoading(true);
    try {
      taskDetailResponse.value = await client.getTaskDetails(taskId);
    } catch (e, s) {
      isLoading(false);
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

  Future<ApplyJobResponse> applyForJob(int jobId) async {
    isLoading(true);
    var response = await client.applyForJob(jobId, userId??0);

    print("apiResponse------->" + taskDetailResponse.value.msg.toString());
    if (response.data?.status == true) {
      isLoading(false);
      // if (actionButtonText.value == AppStrings.txtStartEarning) {
      //   actionButtonText(AppStrings.txtPending);
      // }
      return response;
    } else {
      isLoading(false);
      Get.snackbar(response.message ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }
}
