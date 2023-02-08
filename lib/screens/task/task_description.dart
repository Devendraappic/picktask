import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/screens/task/task_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class TaskDescription extends StatefulWidget {
  const TaskDescription({Key? key}) : super(key: key);

  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {

  var taskController= Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "RBL Bank Saving Account",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                // stops: [0.1, 0.4, 0.7, 0.9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.yellow,
                                  Colors.orange,
                                ],
                              ),
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.center,
                              runSpacing: 5,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tracking Time: "),
                                GradientButton(
                                  height: h * 0.03,
                                  width: w * 0.17,
                                  text: "3 Days",
                                  firstColor: kBlueColor,
                                  secondColor: kBlueColor,
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: 15,),
                      Expanded(
                          flex: 1,
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                // stops: [0.1, 0.4, 0.7, 0.9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.yellow,
                                  Colors.orange,
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Earning"),
                                GradientButton(
                                  height: h * 0.03,
                                  width: w * 0.17,
                                  text: "₹400",
                                  firstColor: kBlueColor,
                                  secondColor: kBlueColor,
                                )
                              ],
                            ),
                          )),
                      SizedBox(width: 10,),
                    ],
                  ),

                  Card(
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: w * 0.035,
                                fontWeight: FontWeight.w400),),

                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: w * 0.035,
                                fontWeight: FontWeight.w400),),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: w * 0.035,
                                fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                ],
              ),
            ),
          ),
          Obx(() {
              return DefaultButton(
                  width: double.infinity,
                  height: h * 0.08,
                  text: taskController.actionButtonText.value,
                  radius: 0,
                  press: () {
                    if( taskController.actionButtonText.value=="Apply Now"){
                      taskController.actionButtonText("Pending");
                    }

                  });
            }
          )
        ],
      ),
    );
  }
}
