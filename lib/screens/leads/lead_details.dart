import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/constants/app_constants.dart';
import 'package:picktask/screens/leads/controller/leads_controller.dart';
import 'package:picktask/screens/task/task_description.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:intl/intl.dart';

class LeadDetails extends StatefulWidget {
  int leadId;
  String leadTitle;
  String leadImage;

  LeadDetails({
    Key? key,
    required this.leadId, required this.leadTitle, required this.leadImage
  }) : super(key: key);

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  var leadsController = Get.find<LeadsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    leadsController.getLeadDetail(widget.leadId);
    var status="";
    if(leadsController.leadDetailResponse.value.data?.status==0){
      status="Pending";
    }else if(leadsController.leadDetailResponse.value.data?.status==1){
      status="Pending";
    }else if(leadsController.leadDetailResponse.value.data?.status==2){
      status="Approved";
    }else if(leadsController.leadDetailResponse.value.data?.status==3){
      status="Rejected";
    }else if(leadsController.leadDetailResponse.value.data?.status==4){
      status="In-Progress";
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Lead Details",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.03),
          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
          height: h * 0.12,
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
            ImageView(
              imageUrl: widget.leadImage,
            height: 60,
            width: 60,
            isCircular: false,radius: 10,),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.leadTitle,
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: w * 0.045,
                  fontWeight: FontWeight.w500),
            ),


            ],
          ),
        ),
        Obx(() {
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: kBlueColor, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [

                    Text(
                        "Credited on : ${DateFormat("ddMMM hh:mm a").format(DateTime.parse(leadsController.leadDetailResponse.value.data?.createdAt??""))}",
                        style: GoogleFonts.poppins(
                        color: kBalckColor,
                        fontSize: w * 0.040,
                        fontWeight: FontWeight.w500)),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Name : ${leadsController.leadDetailResponse.value.data?.name} "
                          "\n Mobile Number : ${leadsController.leadDetailResponse.value.data?.mobile} \n Email : ${leadsController.leadDetailResponse.value.data?.email} \n City: ${leadsController.leadDetailResponse.value.data?.city}",
                          style: GoogleFonts.poppins(
                              color: kBalckColor,
                              fontSize: w * 0.040,
                              fontWeight: FontWeight.w500)),
                    ),

                    Stack(
                      children: [

                        Card(
                          color: kBlueColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: kBlueColor, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                                "Remark : ${leadsController.leadDetailResponse.value.data?.remarks}",
                                style: GoogleFonts.averageSans(
                                    color: kBalckColor,
                                    fontSize: w * 0.040,
                                    fontWeight: FontWeight.w400)),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                        ),
                        Center(
                          child: Positioned(child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // Box decoration takes a gradient
                                  color: Colors.yellow
                              ),
                              child: Text(
                                "Status : $status", style: GoogleFonts.poppins(
                                  color: kBalckColor,
                                  fontSize: w * 0.040,
                                  fontWeight: FontWeight.w500),))),
                        ),
                      ],
                    )

                  ],
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 20.0,horizontal: w * 0.03),
            );
          }
        ),
      ],),
    );
  }
}



