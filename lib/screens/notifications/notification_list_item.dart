import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(w * 0.03),
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
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: w * 0.18,
                    width: w * 0.18,
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kBalckColor),
                    child: Center(
                        child: Image.asset(
                          "assets/images/sbi_logo.png",
                          width: 60,
                        )
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Task Added!",
                    style: GoogleFonts.poppins(
                        color: kBalckColor,
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w500),
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        width: 250,
                        child: Text(
                          "AU Bank credit cards is live on PickTask now scale your earnings with ₹200 each referral.",
                          style: GoogleFonts.poppins(
                              color: kBalckColor,
                              fontSize: w * 0.035,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "22-Dec-2022, 4:00 PM",
                    style: GoogleFonts.poppins(
                        color: kBalckColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),


                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.asset(
                "assets/images/banner_offer.jpeg",
                height: 180.0,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
