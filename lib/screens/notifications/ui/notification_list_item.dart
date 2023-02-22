import 'package:flutter/material.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:intl/intl.dart';

class NotificationListItem extends StatelessWidget {
  NotificationItemData notificationItemData;

  NotificationListItem({Key? key, required this.notificationItemData})
      : super(key: key);

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
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(35), // Image radius
                  child:
                      Image.asset("assets/images/logo1.jpg", fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: w/1.8,
                    child: Text(
                      notificationItemData.heading ?? "",
                      style: GoogleFonts.poppins(
                          color: kBalckColor,
                          fontSize: w * 0.045,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(
                    width: w/1.8,
                    child: Text(
                      notificationItemData.description ??"",
                      style: GoogleFonts.poppins(
                          color: kBalckColor,
                          fontSize: w * 0.035,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    "${DateFormat("dd MMMM hh:mm a").format(DateTime.parse(notificationItemData.createdAt ?? ""))}",
                    style: GoogleFonts.poppins(
                        color: kBalckColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),

          if (notificationItemData.image?.isNotEmpty == true)
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: Image.network(
                    notificationItemData.image ?? "",
                    height: 180.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
