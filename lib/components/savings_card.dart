// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class SavingsCard extends StatelessWidget {
  const SavingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SBI Savings Account",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Earn ₹400 on account openings",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w400),
              ),
              GradientButton(
                height: h * 0.03,
                width: w * 0.17,
                text: "₹400",
              )
            ],
          )
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  double height;
  double width;
  String text;
  GradientButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.04,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
