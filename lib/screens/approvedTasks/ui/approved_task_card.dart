// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/approvedTasks/model/approved_task_response.dart';
import 'package:picktask/screens/createLead/ui/create_lead.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class ApprovedTaskCard extends StatelessWidget {
  ApprovedTaskData approvedTaskData;

  ApprovedTaskCard({required this.approvedTaskData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
            Center(
              //child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Piggy_Bank_or_Savings_Flat_Icon_Vector.svg/2048px-Piggy_Bank_or_Savings_Flat_Icon_Vector.svg.png")),
                child: ImageView(imageUrl:approvedTaskData.photo??"", isCircular: false,
                  height: w * 0.19,
                  width: w * 0.19,
                  radius: 10,

                )),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  approvedTaskData.jobType??"",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.045,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: w * 0.6,
                  child: Text(
                    approvedTaskData.jobname??"",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>CreateLead(taskId: approvedTaskData.jobId??0,title:approvedTaskData.jobType??"",image: approvedTaskData.photo??"",));
                  },
                  child: Container(
                    // height: h * 0.02,
                    // width: w * 0.15,
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        // stops: [0.1, 0.4, 0.7, 0.9],
                        colors: const [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.yellow,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Add Lead",
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.03,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
