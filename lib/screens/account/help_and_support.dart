import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/screens/account/accountsController/accounts_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/utils.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  bool isSelected = false;
  var accountsController = Get.put(AccountsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Help & Support",
            style: GoogleFonts.poppins(
                color: kWhiteColor,
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: accountsController.faqList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (accountsController.faqList[index].isExpanded ==
                                    false) {
                                  accountsController.faqList[index].isExpanded=true;
                                } else {
                                  accountsController.faqList[index].isExpanded=false;
                                }
                                setState(() {

                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF4530CB),
                                          Color(0xFF4530CB),
                                          Color(0xFF6A55F7),
                                          Color(0xFF4530CB),
                                          Color(0xFF4530CB),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        accountsController.faqList[index].title!,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.poppins(
                                            color: kWhiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child:accountsController.faqList[index].isExpanded ==
                                                false? Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: Colors.white,
                                            ):Icon(
                                              Icons.keyboard_arrow_up_sharp,
                                              color: Colors.white,
                                            )))
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: accountsController.faqList[index].isExpanded ==
                                      false
                                  ? false
                                  : true,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  accountsController.faqList[index].description!,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        height: h * 0.07,
                        text: "CALL US",
                        radius: 15,
                        leadingIcon: Icon(Icons.call, color: Colors.white,),
                        press: () {
                          accountsController.openDialer("9610046706");
                        }),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                        height: h * 0.07,
                        text: "EMAIL US",
                        radius: 15,
                        leadingIcon: Icon(Icons.email, color: Colors.white,),
                        press: () async{
                          try {
                            await Utils.launchURL("mailto:partners@picktask.in",);
                          } catch (e) {
                            debugPrint("sendEmail failed ${e}");
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
