import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/screens/createLead/controller/create_lead_controller.dart';
import 'package:picktask/screens/createLead/ui/form_field_item.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';

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
                            Container(
                              height: w * 0.14,
                              width: w * 0.14,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle, color: kWhiteColor),
                              child: Center(
                                  child: Image.network(
                                    widget.image,
                                width: 50,
                              )),
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
                                createLeadsController.formItems.forEach((element) {
                                  print(element.fieldTextController.text);
                                  if (element.fieldTextController.text == null ||
                                      element.fieldTextController.text.isEmpty) {
                                    count+=count;
                                    showToastMsg('${element.field} is required');
                                    return;
                                  }
                                });
                                if(count==0){
                                  showLeadSubmitDialog();
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

  showLeadSubmitDialog() {
    Get.defaultDialog(
      radius: 12,
      content: Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kWhiteColor),
              child: Center(
                  child: Image.asset(
                "assets/images/check.png",
                width: 80,
              )),
            ),
          ),
          SizedBox(
            height: h * 0.1,
          ),
          Expanded(
              child: Text(
            'Success! Your lead was submitted successfully. We will validate your lead. It will take some time.',
            textAlign: TextAlign.center,
          )),
          SizedBox(
            height: h * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Get.back(closeOverlays: true);
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "Okay",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }


}
