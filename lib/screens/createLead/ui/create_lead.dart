import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/createLead/controller/create_lead_controller.dart';
import 'package:picktask/screens/createLead/ui/form_field_item.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/utils.dart';

class CreateLead extends StatefulWidget {
  int taskId;
  String title;
  String image;

  CreateLead({Key? key, required this.taskId, required this.title, required this.image}) : super(key: key);

  @override
  State<CreateLead> createState() => _CreateLeadState();
}

class _CreateLeadState extends State<CreateLead> {
  var createLeadsController = Get.put(CreateLeadController());

  @override
  void initState() {
    createLeadsController.createLeadForm(widget.taskId??0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Create Lead",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(() {
          return createLeadsController.isLoading.value == true
              ? loader:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SingleChildScrollView(
              child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            ImageView(imageUrl: widget.image,
                              isCircular: false,
                              height: 60,
                              width: 60,
                              radius: 8,
                            ),

                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "You're creating lead for ${widget.title}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    color: kWhiteColor,
                                    fontSize: w * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),

                      space(h * 0.01),

                      space(h * 0.02),
                      ListView.builder(
                        itemCount: createLeadsController.formItems.length,
                        shrinkWrap: true,
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05, vertical: h * 0.01),
                            child: CustomFormField(
                                fieldData: createLeadsController.formItems[index],createLeadController:createLeadsController ),
                          );
                        },
                      ),

                      space(h * 0.02),

                       DefaultButton(
                              width: double.infinity,
                              height: h * 0.08,
                              text: "Submit",
                              radius: 15,
                              press: () {

                                int count=0;
                                var myMap = <String, String>{};
                                List<File> images=[];


                                for (var element in createLeadsController.formItems) {
                                  if(element.value=="text"){
                                    myMap[element.field??""]=( element.fieldTextController as TextEditingController).text;
                                  }
                                  else if(element.value=="file"){
                                    images.add(File(element.fieldValue));
                                    //myMap[element.field??""]=Utils.convertIntoBase64(File(element.fieldValue));
                                  }
                                  if (element.fieldTextController.text == null ||
                                      element.fieldTextController.text.isEmpty) {
                                    count+=count;
                                    showToastMsg('${element.field} is required');
                                    continue;
                                  }
                                }
                                if(count==0){
                                  createLeadsController.submitLead(widget.taskId,myMap,images).then((value){
                                    if(value.status==true){
                                      showLeadSubmitDialog(context);
                                    }
                                    myMap.clear();
                                    for (var element in createLeadsController.formItems) {
                                      element.fieldValue="";
                                      element.fieldTextController=TextEditingController();
                                    }
                                  });
                                }
                              }),
                      space(h * 0.1),
                    ],
                  )
            ),
          );
        }
      ),
    );
  }




}
