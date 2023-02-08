import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

import 'notification_list_item.dart';
class NotificationList extends StatelessWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: 14, left: 5, right: 5),
              child: NotificationListItem(),
            );
          },
        ),
      ),
    );
  }
}
