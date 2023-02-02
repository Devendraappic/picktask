import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/screens/task/task_description.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class LeadDetails extends StatelessWidget {
  const LeadDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Lead Details",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(children: [
        Container(
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
              Container(
                height: w * 0.19,
                width: w * 0.19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: kWhiteColor),
                child: Center(
                    child: Image.asset(
                      "assets/images/sbi_logo.png",
                      width: 50,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "CITI Bank Credit Card",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w500),
              ),


            ],
          ),
        ),
        Card(
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

                Text("Credit on : 02 feb 2023",style: GoogleFonts.cabin(
                    color: kBalckColor,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w400)),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name : Kapil Sharma "
                      "\n Mobile Number : 0000000000 \n Email : support@appicsoftwares.com \n City: Jaipur",
                      style: GoogleFonts.cabin(
                      color: kBalckColor,
                      fontSize: w * 0.045,
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
                        child: Text("Remark : We can edit the remark while approving any lead.", style: GoogleFonts.averageSans(
                        color: kBalckColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w400)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                    ),
                    Center(
                      child: Positioned(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Box decoration takes a gradient
                              color: Colors.yellow
                          ),
                          child: Text("Status : Pending", style: GoogleFonts.poppins(
                              color: kBalckColor,
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w500),))),
                    ),
                  ],
                )

              ],
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ),
      ],),
    );
  }
}



