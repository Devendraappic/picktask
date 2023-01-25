import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class LeadsCard extends StatelessWidget {
  const LeadsCard({
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
            height: w * 0.14,
            width: w * 0.14,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: kWhiteColor),
            child: Center(
                child: Image.asset(
              "assets/images/sbi_logo.png",
              width: 50,
            )),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SBI Credit Card",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Pending",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                height: h * 0.03,
                width: w * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    // stops: [0.1, 0.4, 0.7, 0.9],
                    colors: const [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.yellow,
                      Colors.orange,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "View",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
