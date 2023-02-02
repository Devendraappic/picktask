// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.width,
    required this.height,
    Key? key,
    required this.text,
    required this.press,
    required this.radius,
  }) : super(key: key);
  final String text;
  final Function() press;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4530CB),
            Color(0xFF4530CB),
            Color(0xFF6A55F7),
            Color(0xFF4530CB),
            Color(0xFF4530CB),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(radius)),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: press,
        child: Text(
          text,
          style: GoogleFonts.poppins(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
