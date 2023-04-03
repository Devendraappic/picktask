// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/category_card.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/screens/task/controller/task_controller.dart';
import 'package:picktask/screens/task/ui/task_card.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_list.dart';

class MyTasks extends StatefulWidget {
  String taskTitle;
   MyTasks({super.key, required this.taskTitle});

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  var taskController = Get.put(TaskController());
  
  @override
  void initState() {
    taskController.getTaskList(widget.taskTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          widget.taskTitle,
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx( () {
          return taskController.isLoading.value==true?loader:buildUI();
        }
      ),
    );
  }
  Widget buildUI(){
    return taskController.taskList.isNotEmpty? ListView.builder(
      itemCount: taskController.taskList.length,
      shrinkWrap: true,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
          child: TaskCard(
              taskData:taskController.taskList[index]
          ),
        );
      },
    ): Center(
      child: Text(
       AppStrings.txtNoDataFound,
        style: GoogleFonts.poppins(
            color: kWhiteColor,
            fontSize: w * 0.045,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
