import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/components/progress_widget.dart';
import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/account/kycDetails/ui/kyc.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/onboarding/login/ui/login.dart';
import 'package:picktask/screens/onboarding/splash.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/utils.dart';
import 'package:restart_app/restart_app.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:picktask/utils/color.dart';
import 'package:intl/intl.dart';

showToastMsg(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      //backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
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
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(w * 0.03)),
        title: Stack(
          children: [
            Container(
              width: w,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/live_webinar.png",
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "Live Webinar \n${webinar?.content}",
                          textAlign: TextAlign.start,
                          //overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: kBalckColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                  SizedBox(
                    height: 10,
                  ),
                  DefaultButton(
                      width: double.infinity,
                      height: h * 0.07,
                      text: "Join Now",
                      radius: 15,
                      press: () {
                        if(webinar?.url?.isNotEmpty==true){
                          launchYoutube(webinar?.url ?? "");
                        }else{
                          showToastMsg("Oops! Webinar link not found!");
                        }

                      })
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.cancel,
                      color: Colors.black,
                      size: 30,
                    )))
          ],
        ),
      );
    },
  );
}

showWithdrawalSuccessDialog(BuildContext context) {
  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          // backgroundColor: kWhiteColor,
          titlePadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: Center(
                        child: Image.asset(
                      "assets/images/stock_market.png",
                      width: 180,
                    )),
                  ),
                ),
                Expanded(
                    child: Text(
                        'Yay! You have successfully withdrawn your earnings. Please give us some time to credit the amount on your bank account',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kBalckColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.back(closeOverlays: true);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 6),
                        decoration: getDialogButtonDecoration(),
                        child: Text("Okay",
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    },
  );
}

showApplyTaskSuccessDialog(BuildContext context) {
  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          // backgroundColor: kWhiteColor,
          titlePadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: Center(
                        child: Image.asset(
                      "assets/images/stock_market.png",
                      width: 180,
                    )),
                  ),
                ),
                Expanded(
                    child: Text(
                        'Thank you for applying for this task. We are generating details for you, we request you to check this section again after 30 minutes.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kBalckColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.back(closeOverlays: true);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 6),
                        decoration: getDialogButtonDecoration(),
                        child: Text("OK",
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    },
  );
}

showLeadSubmitDialog(BuildContext context) {
  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          titlePadding: EdgeInsets.zero,
          title: Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: Center(
                        child: Image.asset(
                      "assets/images/check.png",
                      width: 140,
                    )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Text(
                        'Success! Your lead was submitted successfully. We will validate your lead. It will take some time.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kBalckColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Get.offAll(HomeNav(index: 2.obs));
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: getDialogButtonDecoration(),
                        child: Text("Okay",
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ));
    },
  );
}

showKycPendingDialog(BuildContext context) {
  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          // backgroundColor: kWhiteColor,
          titlePadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Container(
            height: 340,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/kycstatus_banner.png",
                    width: 160,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Text(
                        'Oops! Your KYC details are not completed. Please complete your KYC so that we can transfer your funds smoothly.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kBalckColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // Get.back(closeOverlays: true);
                      Get.to(() => Kyc());
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        decoration: getDialogButtonDecoration(),
                        child: Text("Complete KYC",
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    },
  );
}
logoutDialogue(BuildContext context) {
  showDialog(
    useSafeArea: false,
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
          scrollable: true,
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(w * 0.03)),
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * 0.03),
              color: Colors.white,
            ),
            height: h * 0.20,
            width: w * 095,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: h * 0.03,
                ),
                Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: kBalckColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  "Are you sure you want to logout?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: kBalckColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: h * 0.025,
                ),
                Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.045,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xffFDAF11), Color(0xffDF8B1D)]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          width: w * 0.3,
                          height: h * 0.045,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff5240D4),
                                  Color(0xff6F5EFC),
                                  Color(0xff5240D4),
                                ]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () async {
                             await storage.erase();
                             await storage.remove(KeyConstants.isLoginKey);
                             await storage.remove(KeyConstants.firebaseTokenKey);
                             await storage.remove(KeyConstants.userIdKey);
                             await storage.remove(KeyConstants.nameKey);
                             await storage.remove(KeyConstants.refCodeKey);
                             await storage.remove(KeyConstants.emailKey);
                             await storage.remove(KeyConstants.mobileKey);
                             await storage.remove(KeyConstants.profilePicKey);
                             await storage.remove(KeyConstants.partnerIdKey);
                             await storage.remove(KeyConstants.earningKey);
                             await storage.remove(KeyConstants.totalWalletAmountKey);
                             await storage.remove(KeyConstants.currentWalletAmountKey);
                             await storage.remove(KeyConstants.accountStatusKey);
                             await storage.remove(KeyConstants.kycStatusKey);
                             await Utils.deleteCacheDir();
                             await Utils.deleteAppDir();
                             await storage.save();
                             Restart.restartApp();
                             // Get.offAll(const Spalsh());
                            },
                            child: Text(
                              "Confirm",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ));
    },
  );
}


Decoration getDialogButtonDecoration() {
  return BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xFF4530CB),
        Color(0xFF6A55F7),
        Color(0xFF4530CB),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      borderRadius: BorderRadius.circular(10));
}
