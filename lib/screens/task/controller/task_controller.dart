import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/task/model/apply_job_response.dart';
import 'package:picktask/screens/task/model/task_detail_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/local_storage.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  var taskList = <TaskData>[].obs;
  final client = ApiClient();

  var taskDetailResponse = TaskDetailResponse().obs;
  var htmlData = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<TaskListResponse> getTaskList(String category) async {
    var response = TaskListResponse();
    try {
      isLoading(true);
      response = await client.getTasks(category);
    } catch (e, s) {
      print(e);
      print(s);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      isLoading(false);
      taskList.value = response.data ?? [];

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");

    }
    return response;
  }

  Future<TaskDetailResponse> getTaskDetail(int taskId) async {
    isLoading(true);
     var response= TaskDetailResponse();
    try {
      response = await client.getTaskDetails(taskId, userId??0);
    } catch (e, s) {
      isLoading(false);
      print(s);
    }
    print("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      isLoading(false);
      taskDetailResponse(response);
      htmlData(taskDetailResponse.value.data?.description??"");
      return response;
    } else {
      isLoading(false);

      showToastMsg(response.msg ?? "");
    }
    return response;
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
      showToastMsg(response.message ?? "");
    }
    return response;
  }
}
