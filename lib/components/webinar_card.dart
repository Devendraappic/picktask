import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class WebinarCard extends StatelessWidget {
  const WebinarCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: w * 0.3,
      height: h * 0.19,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: kWhiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/sbi_logo.png",
            width: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "SBI - Credit Card",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: w * 0.035,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "21 Nov 3:00 PM",
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: w * 0.033,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Intrested?",
            style: GoogleFonts.poppins(
                color: Colors.red,
                fontSize: w * 0.035,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
