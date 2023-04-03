import 'dart:developer';

import 'package:get/get.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/leads/model/filter_model.dart';
import 'package:picktask/screens/leads/model/lead_detail_response.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';

import '../../../utils/local_storage.dart';

class LeadsController extends GetxController {
  var isLoading = false.obs;
  var filterList = <FilterModel>[].obs;
  var leadsList = <LeadData>[].obs;

  var selectedStatus = "any".obs;
  var status = "".obs;
  final client = ApiClient();

  var leadDetailResponse = LeadDetailResponse().obs;

  @override
  void onInit() {
    getLeadCategories();
    super.onInit();
  }

  getLeadCategories() {
    filterList.add(FilterModel("any", "All", true));
    filterList.add(FilterModel("pending", "Pending", false));
    filterList.add(FilterModel("inprogress", "In-Process", false));
    filterList.add(FilterModel("approved", "Approved", false));
    filterList.add(FilterModel("reject", "Rejected", false));
  }

  Future<LeadsResponse> getLeadsList(String status) async {
    print("apiCall");
    var response = LeadsResponse();
    try {
      isLoading(true);
      response =
          await client.getLeads(userId??0, status);
    } catch (e, s) {
      print(e);
      print(s);
    }
    print("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      isLoading(false);
      leadsList.value = response.data ?? [];

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }

  Future<LeadDetailResponse> getLeadDetail(int leadId) async {
    var res= LeadDetailResponse();
    try {
      isLoading(true);
      res = await client.getLeadDetail(leadId);
    } catch (e, s) {
      print(s);
    }
    if (res.status == true) {
      isLoading(false);
      leadDetailResponse(res);
      return res;
    } else {
      isLoading(false);

      showToastMsg(res.msg ?? "");
    }
    return res;
  }
}
