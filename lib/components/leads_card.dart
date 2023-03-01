import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/constants/app_constants.dart';
import 'package:picktask/screens/leads/lead_details.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class LeadsCard extends StatelessWidget {
  LeadData leadData;
   LeadsCard({
    Key? key,
     required this.leadData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var status="";
    if(leadData.status==1){
      status="Pending";
    }if(leadData.status==2){
      status="Approved";
    }if(leadData.status==3){
      status="Rejected";
    }if(leadData.status==4){
      status="In-Progress";
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      height: h * 0.10,
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
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(25), // Image radius
              child: ImageView(
                imageUrl: ("${AppConstants.baseUrl}${leadData.image}").replaceAll("//", "/"),
                  isCircular: true

              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leadData.name??"",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.045,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                status,
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w400),
              ),

            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Get.to(()=>LeadDetails(leadId: leadData.id??0, leadTitle: leadData.name??"",leadImage: leadData.image??"",));
            },
            child: Container(
              height: h * 0.03,
              width: w * 0.15,
              margin: EdgeInsets.only(left: 20, top: 30),
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
            ),
          )
        ],
      ),
    );
  }
}
