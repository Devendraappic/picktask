import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class NoDataFoundPage extends StatelessWidget {
  final String? errorTitle;
  const NoDataFoundPage({Key? key, this.errorTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Image.asset("assets/images/exclamation.png", fit: BoxFit.cover,color: kBlueColor,),
        const SizedBox(height: 20,),
        Text(
          "No $errorTitle Found!",
          //AppStrings.txtNoDataFound,
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.045,
              fontWeight: FontWeight.w500),
        ),
      ],),
    );
  }
}
