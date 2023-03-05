import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/task/controller/task_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/hex_color.dart';

class TaskDescription extends StatefulWidget {
  int taskId;
   TaskDescription({Key? key, required this.taskId}) : super(key: key);

  @override
  State<TaskDescription> createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  var taskController= Get.find<TaskController>();
  var htmlData = "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>";
  var status="";
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      taskController.getTaskDetail(widget.taskId);
    });

    return Obx(() {

      if(taskController.taskDetailResponse.value.data?.status==0){
        status="Start Earning";
      }else if(taskController.taskDetailResponse.value.data?.status==1){
        status="Pending";
      }else if(taskController.taskDetailResponse.value.data?.status==2){
        status="Approved";
      }else if(taskController.taskDetailResponse.value.data?.status==3){
        status="Rejected";
      }else if(taskController.taskDetailResponse.value.data?.status==4){
        status="In-Progress";
      }
        return taskController.isLoading.value==true?loader:Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              taskController.taskDetailResponse.value.data?.jobType??"",
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: w * 0.05,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        ImageView(imageUrl: taskController.taskDetailResponse.value.data?.photo??"",
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
                                        text: taskController.taskDetailResponse.value.data?.trackingtime??"",
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
                                        text: "₹${taskController.taskDetailResponse.value.data?.earning??""}",
                                        firstColor: kBlueColor,
                                        secondColor: kBlueColor,
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),

                        Card(
                          color: getColorFromHex("#2e2624"),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: getColorFromHex("#2e2624"), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            width: w,
                            child: Text(
                              taskController.taskDetailResponse.value.data?.description??"",
                              style:  GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: w * 0.035,
                              fontWeight: FontWeight.w400),),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DefaultButton(
                      width: double.infinity,
                      height: h * 0.08,
                      text: status,
                      radius: 15,
                      press: () {
                        if(taskController.taskDetailResponse.value.data?.status==0){
                          taskController.applyForJob(widget.taskId).then((value){
                            if(value.success==true){
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                taskController.getTaskDetail(widget.taskId);
                              });

                            }
                          });
                        }

                      }),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
