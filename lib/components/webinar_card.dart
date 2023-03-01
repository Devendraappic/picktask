import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:intl/intl.dart';

class WebinarCard extends StatelessWidget {
  Webinar? webinar;

   WebinarCard({
    Key? key,
     this.webinar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showWebinarDialog(context, webinar);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10, top: 5),
        width: w * 0.3,
        //height: h * 0.18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: kWhiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ImageView(imageUrl: webinar?.image??"",isCircular: false, width: 40, height: 40,radius: 0,)
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              webinar?.content??"",
              maxLines: 2,
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: w * 0.035,
                  fontWeight: FontWeight.w600),
            ),
            if(webinar?.createdAt?.isNotEmpty==true)
              Text(
                "${DateFormat("dd MMM hh:mm a").format(DateTime.parse(webinar?.date??""))}",
                maxLines: 1,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: w * 0.028,
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
      ),
    );
  }
}
