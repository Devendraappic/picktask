import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/screens/account/referAndEarn/model/refer_and_earn_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

import '../../../../components/black_box.dart';

class ReferedUser extends StatelessWidget {
  ReferUserData? referUserData;
   ReferedUser({Key? key, this.referUserData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlackBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: w * 0.07,
                  backgroundImage: NetworkImage(
                      referUserData?.profilePic??"https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc="),
                ),
                SizedBox(
                  width: w * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      referUserData?.name??"",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      referUserData?.mobile??"",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          decorationWidth: w * 0.1,
          width: double.infinity,
          margin: w * 0.00),
    );
  }
}
