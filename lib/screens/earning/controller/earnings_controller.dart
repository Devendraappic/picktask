import 'dart:developer';

import 'package:get/get.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/earning/model/withdrawal_list_response.dart';
import 'package:picktask/screens/leads/model/filter_model.dart';
import 'package:picktask/screens/leads/model/lead_detail_response.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/screens/task/model/apply_job_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';

import '../../../utils/local_storage.dart';

class EarningsController extends GetxController {
  var isLoading = false.obs;
  var withdrawalList= <ListData>[].obs;
  var withdrawalListResponse = WithdrawalListResponse().obs;
  final client = ApiClient();


  Future<WithdrawalListResponse> getWithdrawalList() async {
    print("apiCall");
    isLoading(true);
    var response;
    try {

      response = await client.withdrawalList(userId??0);
    } catch (e, s) {
      print(e);
      print(s);
      isLoading(false);
    }

    if (response.success == true) {
      isLoading(false);
      withdrawalListResponse.value=response;
      withdrawalList.value = response.data?.data ?? [];

      return response;
    } else {
      isLoading(false);
    }
    return response;
  }


  Future<ApplyJobResponse> applyWithdrawal(double amount) async {
    isLoading(true);
    var response = await client.withdrawalRequest(userId??0, amount);

    if (response.data?.status == true) {
      isLoading(false);
      getWithdrawalList();
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.message ?? "");
    }
    return response;
  }

}
