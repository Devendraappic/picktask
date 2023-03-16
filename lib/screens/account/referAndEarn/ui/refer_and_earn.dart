// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/black_box.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/screens/account/referAndEarn/controller/refer_and_earn_controller.dart';
import 'package:picktask/screens/account/referAndEarn/ui/reffered_user_card.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:share_plus/share_plus.dart';
import'dart:io' show Platform;

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({super.key});

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  var referAndEarnController = Get.put(ReferAndEarnController());

  @override
  void initState() {
    referAndEarnController.getMyReferals(context, userId??0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Refer & Earn",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(()=>referAndEarnController.isLoading.value?loader:SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "Refer your friends & earn unlimited",
            style: GoogleFonts.poppins(
                color: kWhiteColor,
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700),
          ),
          space(h * 0.01),
          Text(
            "Get a flat ₹20 in your wallet + 10% of your\n friends earning",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                height: 1.2,
                color: kWhiteColor,
                fontSize: w * 0.038,
                fontWeight: FontWeight.w500),
          ),
          space(h * 0.01),
          Image.asset(
            "assets/images/savings.png",
            width: w * 0.25,
          ),
          space(h * 0.02),
          Container(
            width: double.infinity,
            height: h * 0.08,
            margin: EdgeInsets.symmetric(horizontal: w * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * 0.06),
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                // stops: [0.1, 0.4, 0.7, 0.9],
                colors: const [
                  // Colors are easy thanks to Flutter's Colors class.
                  Color(0xFF634FFC),
                  Color(0xFF6B57FC),
                ],
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your referral code",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.03,
                            fontWeight: FontWeight.w500),
                      ),
                      Obx(() => Text(
                        referAndEarnController.myRefrerId.value,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.w500),
                      ),)
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      if(Platform.isAndroid){
                        if(referAndEarnController.myRefrerId.isNotEmpty){
                          Share.share(
                              'Hi Dear\nDownload PickTask app and start earning upto Rs. 1 Lakh every month by completing tasks of over 50+ Indian leading brands like SBI Bank, Axis Bank, PayTm Money, Airtel, Flipkart, Sugar, Lenskart & many more.\n\nYou can also earn ₹20 & 10% lifetime earning by referring your friends & family!\n\nDownload PickTask and Be Your Own Boss!\n\n Link: https://play.google.com/store/apps/details?id=com.picktask\n\n '
                                  'Use my referral code: ${referAndEarnController.myRefrerId}',
                              subject: 'Referral code');
                        }else{
                          showToastMsg("You have no referral code");
                        }
                      }


                    },
                    child: GradientButton(
                      height: h * 0.03, width: w * 0.2, text: "Share",
                      firstColor: Colors.yellow,
                      secondColor: Colors.orange,),
                  )
                ]),
          ),
          space(h * 0.02),
          BlackBox(
            decorationWidth: w * 0.03,
            width: double.infinity,
            margin: w * 0.05,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(h * 0.02),
                  Text(
                    "How it Works?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 3,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(w * 0.08)),
                  ),
                  space(h * 0.01),
                  Text(
                    "1. Share PickTask download link and your unique refferal code with your friend or teams.\n\n2. Your friend joins PickTask using your refferal code and complete registration.\n\n3 Your friend needs to complete their first task and get approved.\n\n4. Done! You will get ₹20 in your wallet and 10% refferal income if your friend actives on PickTask",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.034,
                        fontWeight: FontWeight.w500),
                  ),
                  space(h * 0.02),
                ],
              ),
            ),
          ),
          space(h * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Referred Users",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 3,
                    width: w * 0.2,
                    decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(w * 0.08)),
                  ),
                  space(h * 0.02),
                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: referAndEarnController.referralList.map((element) {
                        return ReferedUser(referUserData: element,);
                      }).toList(),
                    );
                  }
                  )
                ],
              ),
            ),
          ),
          space(h * 0.07),
        ]),
      )),
    );
  }
}
