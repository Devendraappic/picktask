import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';

class TaskController extends GetxController{

  var actionButtonText= "".obs;

  @override
  void onInit() {
    actionButtonText.value= AppStrings.txtStartEarning;
    super.onInit();
  }
}