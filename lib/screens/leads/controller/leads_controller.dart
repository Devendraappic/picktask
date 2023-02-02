
import 'dart:developer';

import 'package:get/get.dart';

class FilterModel {
  int id = 0;
  var name = "";
  bool isSelected = false;

  FilterModel(this.id,  this.name,  this.isSelected);
}

class LeadsController extends GetxController {

  var filterList = <FilterModel>[].obs;

  @override
  void onInit() {
    getLeadCategories();
    super.onInit();
  }

  getLeadCategories(){
    filterList.add(FilterModel(1, "All", true));
    filterList.add(FilterModel(1, "Pending", false));
    filterList.add(FilterModel(1, "In-Process", false));
    filterList.add(FilterModel(1, "Approved", false));
    filterList.add(FilterModel(1, "Rejected", false));
  }


}
