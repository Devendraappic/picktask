import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/category_card.dart';
import 'package:picktask/screens/approvedTasks/controller/approved_tasks_controller.dart';
import 'package:picktask/screens/approvedTasks/ui/approved_task_card.dart';
import 'package:picktask/screens/task/controller/task_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_list.dart';

class ApprovedTasks extends StatefulWidget {
  ApprovedTasks({super.key});

  @override
  State<ApprovedTasks> createState() => _ApprovedTasksState();
}

class _ApprovedTasksState extends State<ApprovedTasks> {
  var taskController = Get.put(ApprovedTasksController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskController.getApprovedTasksList();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "My Tasks",
            style: GoogleFonts.poppins(
                color: kWhiteColor,
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Obx(() {
          return taskController.isLoading.value==true?loader:buildUI();
        }
        ));
  }
  Widget buildUI(){
    return  taskController.taskList.isNotEmpty ? ListView.builder(
      itemCount: taskController.taskList.length,
      shrinkWrap: true,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: w * 0.05, vertical: h * 0.01),
          child: ApprovedTaskCard(
              approvedTaskData: taskController.taskList[index]
          ),
        );
      },
    ) : Center(
        child: Text(
          "You have no approved task!",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.045,
              fontWeight: FontWeight.w500),));
  }
}
