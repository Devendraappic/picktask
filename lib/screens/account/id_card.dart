import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class IdCard extends StatelessWidget {
  const IdCard({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            width: double.infinity,
            height: h * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff5240D4),
                    Color(0xff6F5EFC),
                    Color(0xff5240D4),
                  ]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.red,
                    ),
                    space(0.005),
                    Text(
                      "Sahil Kumar",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    space(0.005),
                    Text(
                      "Sales Partner",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    space(0.005),
                    Text(
                      "Partner ID: 1234",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    space(0.005),
                    Text(
                      "Sahil Kumar",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
