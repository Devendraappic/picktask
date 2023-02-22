// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/category_card.dart';
import 'package:picktask/screens/task/controller/task_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_list.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var taskController = Get.put(TaskController());
  
  @override
  void initState() {
    taskController.getTaskList("Loan/credit");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Select Category",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx( () {
          return taskController.isLoading.value?loader:ListView.builder(
            itemCount: taskController.taskList.length,
            shrinkWrap: true,
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
                child: CategoryCard(
                  taskData:taskController.taskList[index]
                ),
              );
            },
          );
        }
      ),
    );
  }
}
