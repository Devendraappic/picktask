import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/components/no_data_widget.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/screens/notifications/controller/notification_list_controller.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/screens/notifications/ui/notification_list_item.dart';
import 'package:picktask/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  var notificationListController = Get.put(NotificationListController());

  @override
  void initState() {
    notificationListController.getNotificationList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(() {
          return notificationListController.isLoading.value?loader:buildUi();
        }
      ),
    );
  }
  Widget buildUi(){
    return notificationListController.notificationList.value.isNotEmpty?ListView.builder(
      itemCount:notificationListController.notificationList.value.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
              bottom: 14, left: 5, right: 5),
          child: NotificationListItem(notificationItemData: notificationListController.notificationList.value[index],),
        );
      },
    ): Center(
      child: Text(
        "No notifications available!",
        style: GoogleFonts.poppins(
            color: kWhiteColor,
            fontSize: w * 0.045,
            fontWeight: FontWeight.w500),
      ),
    );
  }

}
