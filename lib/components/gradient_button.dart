import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/color.dart';

class GradientButton extends StatelessWidget {
  double height;
  double width;
  String text;
  Color firstColor;
  Color secondColor;
  GradientButton({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
    required this.firstColor,
    required this.secondColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient:  LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            firstColor,
            secondColor
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