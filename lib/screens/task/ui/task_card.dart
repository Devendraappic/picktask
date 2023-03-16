// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:picktask/screens/task/ui/task_description.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class TaskCard extends StatelessWidget {
  TaskData taskData;

  TaskCard({super.key, required this.taskData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>TaskDescription(taskId:taskData.id??0));
      },
      child: Container(
        padding: EdgeInsets.all(10),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: ImageView(imageUrl: taskData.photo??"",isCircular: false, radius: 10 , height: w * 0.17,
                  width: w * 0.17,)),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskData.title ?? "",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: w * 0.6,
                  child: Text(
                    taskData.tagline ?? "",
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 3,),
                GradientButton(
                  height: h * 0.03,
                  width: w * 0.17,
                  text: "₹${ taskData.earning ?? ""}",
                  firstColor: Colors.yellow,
                  secondColor: Colors.orange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
