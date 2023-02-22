// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/screens/leads/category.dart';
import 'package:picktask/screens/leads/savings.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class CategoryCard extends StatelessWidget {
  TaskData taskData;
  CategoryCard(
      {required this.taskData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>SavingsAccount());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        height: h * 0.10,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            // stops: [0.1, 0.4, 0.7, 0.9],
            colors: const [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xFF2B252A),
              Color(0xFF1F2131),
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              height: w * 0.19,
              width: w * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: taskData.photo?.isNotEmpty==true?Image.network(taskData.photo??""):Image.asset("assets/images/logo1.jpg")),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskData.jobType??"",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: w * 0.6,
                  child: Text(
                    taskData.description??"",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
