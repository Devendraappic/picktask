import 'dart:developer';

import 'package:get/get.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/earning/model/withdrawal_list_response.dart';
import 'package:picktask/screens/leads/model/filter_model.dart';
import 'package:picktask/screens/leads/model/lead_detail_response.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/utils/color.dart';

import '../../../utils/local_storage.dart';

class EarningsController extends GetxController {
  var isLoading = false.obs;
  var withdrawalList= <WithdrawalItemData>[].obs;

  final client = ApiClient();


  @override
  void onInit() {
    //getLeadCategories();
    super.onInit();
  }


  Future<WithdrawalListResponse> getWithdrawalList() async {
    print("apiCall");
    var response = WithdrawalListResponse();
    try {
      isLoading(true);
      response =
          await client.withdrawalList(/*userId??0*/ 198);
    } catch (e, s) {
      print(s);
    }

    if (response.success == true) {
      isLoading(false);
      withdrawalList.value = response.data?.data ?? [];

      return response;
    } else {
      isLoading(false);
     // Get.snackbar(response.msg ?? "", "", colorText: kWhiteColor);
    }
    return response;
  }

}
