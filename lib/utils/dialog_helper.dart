import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/progress_widget.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:picktask/utils/color.dart';
import 'package:intl/intl.dart';

showToastMsg(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      //backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

//ProgressDialog
/*
showProgressDialog(BuildContext context) {
  Widget _drawerWidget = Container(
    child: SafeArea(
      child: SizedBox.expand(
        child: ProgressWidget(),
      ),
    ),
    color: Colors.transparent,
  );

  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3),
    transitionDuration: Duration(milliseconds: 50),
    context: context,
    pageBuilder: (_, __, ___) {
      return _drawerWidget;
    },
  );
}
*/

showWebinarDialog(BuildContext context, Webinar? webinar) {

  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          // backgroundColor: kWhiteColor,
          titlePadding:EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(w * 0.03)),
          title: Stack(
            children: [
              Container(
                width: w,
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.stream_sharp, size: 40,),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: w/2,
                          child: Text(
                            "Live Webinar \n${webinar?.content}",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                color: kBalckColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Icon(Icons.timer_sharp, size: 40,),
                        SizedBox(width: 10,),
                        Text(
                          "Webinar Time\n${DateFormat("dd-MMM-yyyy hh:mm a").format(DateTime.parse("${webinar?.date} ${webinar?.time}"))} ",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: kBalckColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    DefaultButton(
                        width: double.infinity,
                        height: h * 0.07,
                        text: "Join Now",
                        radius: 15,
                        press: () {

                          Utils.launchURL(webinar?.url??"");

                        })
                  ],
                ),
              ),
              Positioned(
                  top: 10, right: 10,
                  child: GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.cancel, color: Colors.black,size: 30,)))
            ],
          ),);
    },
  );
}

showWithdrawalSuccessDialog(BuildContext context){
  Get.defaultDialog(
    radius: 12,
    title: "",
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    content:Wrap(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: kWhiteColor),
            child: Center(
                child: Image.asset(
                  "assets/images/stock_market.png",
                  width: 120,
                )),
          ),
        ),
        SizedBox(
          height: h * 0.1,
        ),
        Expanded(child: Text(
          'Yay! You have successfully withdrawn your earnings. Please give us some time to credit the amount on your bank account',
          textAlign: TextAlign.center,)),

        SizedBox(
          height: h * 0.1,
        ),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: (){
              Get.back(closeOverlays: true);
            },
            child: Container(

                padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
                decoration: BoxDecoration(
                    color: kBlueColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child:Text("Okay", style: TextStyle(color: Colors.white),)
            ),
          ),
        ),

      ],
    ),
  );
}

//  closeDialog() {
//   Get.back();
// }

