import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/task/controller/task_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/hex_color.dart';
import 'package:share_plus/share_plus.dart';

class TaskDescription extends StatefulWidget {
  int taskId;

  TaskDescription({Key? key, required this.taskId}) : super(key: key);

  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  var taskController = Get.find<TaskController>();

@override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    taskController.getTaskDetail(widget.taskId);
  });
    super.initState();
  }
  Future<void> _pullRefresh() async {
    taskController.getTaskDetail(widget.taskId);
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: Obx(() {
        if (taskController.taskDetailResponse.value.data?.newStatus == 1) {
          taskController.status("Start Earning");
          taskController.btnVisibility(true);
        } else if (taskController.taskDetailResponse.value.data?.newStatus == 2) {
          if (taskController.taskDetailResponse.value.data?.shareUrl?.isNotEmpty ==
              true) {
            taskController.status("Share Link");
            taskController.btnVisibility(true);
          } else {
            taskController.status("Approved");
            taskController.btnVisibility(false);
          }
        } else if (taskController.taskDetailResponse.value.data?.newStatus == 3) {
          taskController.status("Rejected");
          taskController.btnVisibility(true);
        } else if (taskController.taskDetailResponse.value.data?.newStatus == 4) {
          taskController.status("Pending");
          taskController.btnVisibility(true);
        }
        return  Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  centerTitle: true,
                  title: Text(
                    taskController.taskDetailResponse.value.data?.jobType ?? "",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                body: taskController.isLoading.value == true
                    ? loader:Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ImageView(
                                imageUrl: taskController
                                        .taskDetailResponse.value.data?.bannerimg ??
                                    "",
                                isCircular: false,
                                height: 110.0,
                                radius: 10,
                                width: double.infinity,
                                boxFit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
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
                                              width: w * 0.18,
                                              text: taskController
                                                      .taskDetailResponse
                                                      .value
                                                      .data
                                                      ?.trackingtime ??
                                                  "",
                                              firstColor: kBlueColor,
                                              secondColor: kBlueColor,
                                            )
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    width: 15,
                                  ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Earning"),
                                            GradientButton(
                                              height: h * 0.03,
                                              width: w * 0.17,
                                              text:
                                                  "₹${taskController.taskDetailResponse.value.data?.earning ?? ""}",
                                              firstColor: kBlueColor,
                                              secondColor: kBlueColor,
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                              Card(
                                // color: getColorFromHex("#2e2624"),
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: getColorFromHex("#2e2624"),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  width: w,
                                  child:
                                   HtmlWidget(
                                      taskController.taskDetailResponse.value.data?.description ?? "",
                                   textStyle:  GoogleFonts.poppins(
                                           color: Colors.white,
                                           fontSize: w * 0.035,
                                           fontWeight: FontWeight.w400),

                                           ),



                                ),
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      if(taskController.btnVisibility.value)
                      DefaultButton(
                          width: double.infinity,
                          height: h * 0.08,
                          text: taskController.status.value,
                          radius: 15,
                          press: () {
                            if (taskController
                                    .taskDetailResponse.value.data?.newStatus ==
                                1) {
                              taskController
                                  .applyForJob(widget.taskId)
                                  .then((value) {
                                if (value.data?.status == true) {
                                  showApplyTaskSuccessDialog(context);
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    taskController.getTaskDetail(widget.taskId);
                                  });
                                }
                              });
                            } else if (taskController.taskDetailResponse.value
                                        .data?.newStatus ==
                                    2 &&
                                taskController.taskDetailResponse.value.data
                                        ?.shareUrl?.isNotEmpty ==
                                    true) {
                              Share.share(
                                  '${taskController.taskDetailResponse.value.data
                                      ?.shareMessage} ${taskController.taskDetailResponse.value.data
                                      ?.shareUrl}',
                                  subject:
                                      '${taskController.taskDetailResponse.value.data?.title}');
                            }
                          }),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
