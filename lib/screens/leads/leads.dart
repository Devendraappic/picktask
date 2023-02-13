// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/leads_card.dart';
import 'package:picktask/screens/leads/controller/leads_controller.dart';
import 'package:picktask/screens/leads/create_lead.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';


class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  var leadsController= Get.put(LeadsController());
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Leads",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 44,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(23))),
            child: Obx(() {
                return ListView.builder(
                    itemCount:leadsController.filterList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int position) {
                      return GestureDetector(
                        onTap:(){
                          for (var element in leadsController.filterList) {
                            element.isSelected=false;
                          }
                          leadsController.filterList[position].isSelected= true;

                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: leadsController.filterList[position].isSelected?BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.all(Radius.circular(23))):null,
                          child: Center(
                              child: Text(
                                leadsController.filterList[position].name,
                            style: TextStyle(color: leadsController.filterList[position].isSelected?Colors.white:Colors.black),
                          )),
                        ),
                      );
                    });
              }
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              controller: scrollController,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 14),
                  // padding: EdgeInsets.only(bottom: 14, left: w * 0.05, right: w * 0.05),
                  child: LeadsCard(),
                );
              },
            ),
          ),

          // SizedBox(
          //   height: h * 0.1,
          // ),
          GestureDetector(
            onTap: (){
              Get.to(()=>CreateLead());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 40.0),
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              decoration: BoxDecoration(
                  color: kBlueColor,
                  borderRadius: BorderRadius.all(Radius.circular(23))),
              child: RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Create Lead",
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
