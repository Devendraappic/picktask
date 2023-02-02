import 'package:get/get.dart';

class TaskController extends GetxController{

  var actionButtonText= "".obs;

  @override
  void onInit() {
    actionButtonText.value= "Apply Now";
    super.onInit();
  }
}