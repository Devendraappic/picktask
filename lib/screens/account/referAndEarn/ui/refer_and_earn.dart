// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/black_box.dart';
import 'package:picktask/components/gradient_button.dart';
import 'package:picktask/screens/account/referAndEarn/controller/refer_and_earn_controller.dart';
import 'package:picktask/screens/account/referAndEarn/ui/reffered_user_card.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';

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
            style: GoogleFonts.cabin(
                color: kWhiteColor,
                fontSize: w * 0.05,
                fontWeight: FontWeight.w700),
          ),
          space(h * 0.01),
          Text(
            "Get a flat ₹20 in your wallet + 10% of your\n friends earning",
            textAlign: TextAlign.center,
            style: GoogleFonts.cabin(
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
                  GradientButton(
                    height: h * 0.03, width: w * 0.2, text: "Share",
                    firstColor: Colors.yellow,
                    secondColor: Colors.orange,)
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
                    "So I'm so close to having my app ready to upload to the PlayStore, but I can't get KeyStore figured out. I am using flutter, which provides what I need from java in order to run keytool. I get into the right directory, ( I just followed the docs on this process from flutter.dev) C:\Users\Jake Gill\AndroidStudio\jre\bin I've gone through the process a thousand different ways of adding keystore passwords and my name and city and all that just for it to tell me that the path I provided for the key.jks to be added to is an illegal option. I'm using this from flutter.dev:",
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
