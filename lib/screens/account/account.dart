// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/webView.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/account/change_password.dart';
import 'package:picktask/screens/account/help_and_support.dart';
import 'package:picktask/screens/account/id_card.dart';
import 'package:picktask/screens/account/kyc.dart';
import 'package:picktask/screens/account/refer_and_earn.dart';
import 'package:picktask/screens/onboarding/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/local_list.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/extra_widget.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            space(h * 0.07),
            Container(
              height: w * 0.25,
              width: w * 0.25,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn5-ss8.sharpschool.com/UserFiles/Servers/Server_416292/Image/Profile%20pic.png"))),
            ),
            space(h * 0.02),
            Text(
              "TUSHAR AGARWAL",
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: w * 0.06,
                  fontWeight: FontWeight.w600),
            ),
            space(h * 0.01),
            Text(
              "Partner Code: GSI",
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: w * 0.035,
                  fontWeight: FontWeight.w400),
            ),
            space(h * 0.03),
            Container(
              height: h * 0.075,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "My KYC",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.045,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: w * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Kyc());
                    },
                    child: Container(
                      height: h * 0.03,
                      width: w * 0.25,
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
                          "Pending",
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
            ),
            space(h * 0.02),
            Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    space(h * 0.01),
                    ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 0.02),
                      itemCount: accountMenuList.length,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(top: h * 0.015),
                          child: AccountMenu(
                            press: () {
                              switch (index) {
                                case 0:
                                  {
                                    Get.to(() => IdCard());
                                  }

                                  break;
                                case 1:
                                  {
                                    Get.to(() => WebViewQuests(
                                        title: "PickTask Introduction",
                                        url:
                                            "https://www.picktask.in/introduction"));
                                  }

                                  break;
                                case 3:
                                  {
                                    Get.to(() => HelpAndSupport());
                                  }

                                  break;

                                case 4:
                                  {
                                    Get.to(() => ChangePassword());
                                  }

                                  break;

                                case 2:
                                  {
                                    Get.to(() => ReferAndEarn());
                                  }

                                  break;

                                case 5:
                                  {
                                    Get.to(() => WebViewQuests(
                                        title: "Privacy Policy",
                                        url:
                                            "https://www.picktask.in/privacy-policy"));
                                  }

                                  break;

                                case 6:
                                  {
                                    Get.to(() => WebViewQuests(
                                        title: "Terms & Conditions",
                                        url:
                                            "https://www.picktask.in/terms-and-conditions"));
                                  }

                                  break;

                                default:
                                  {
                                    logoutDialogue(context);

                                    // Get.defaultDialog(
                                    //     contentPadding: EdgeInsets.all(10),
                                    //     title: "",

                                    //     // titleStyle: TextStyle(color: Colors.black, fontSize: 17),

                                    //     content: Column(
                                    //       children: [
                                    //         Text(
                                    //             "Are you sure you want to "
                                    //             "\nLogout?",
                                    //             textAlign: TextAlign.center,
                                    //             style: GoogleFonts.cabin(
                                    //                 color: Colors.black,
                                    //                 fontSize: 18,
                                    //                 fontWeight:
                                    //                     FontWeight.w500)),
                                    //         SizedBox(
                                    //           height: 20,
                                    //         ),
                                    //         SizedBox(
                                    //           width: 140,
                                    //           height: 40,
                                    //           child: TextButton(
                                    //             style: TextButton.styleFrom(
                                    //               shape: RoundedRectangleBorder(
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           10)),
                                    //               backgroundColor:
                                    //                   kPrimaryColor,
                                    //             ),
                                    //             onPressed: () async {
                                    //               Get.offAllNamed("/login");
                                    //             },
                                    //             child: Text(
                                    //               "Logout",
                                    //               style: GoogleFonts.cabin(
                                    //                   color: Colors.white,
                                    //                   fontSize: 16,
                                    //                   fontWeight:
                                    //                       FontWeight.w600),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         SizedBox(
                                    //           height: 5,
                                    //         ),
                                    //         SizedBox(
                                    //           width: 140,
                                    //           height: 40,
                                    //           child: TextButton(
                                    //             style: TextButton.styleFrom(
                                    //               shape: RoundedRectangleBorder(
                                    //                   borderRadius:
                                    //                       BorderRadius.circular(
                                    //                           20)),
                                    //             ),
                                    //             onPressed: () {
                                    //               Get.back();
                                    //             },
                                    //             child: Text(
                                    //               "Cancel",
                                    //               style: GoogleFonts.cabin(
                                    //                   color: Colors.black,
                                    //                   fontSize: 16,
                                    //                   fontWeight:
                                    //                       FontWeight.w600),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ));

                                  }
                              }
                            },
                            title: accountMenuList[index]["title"].toString(),
                            image: accountMenuList[index]["image"].toString(),
                          ),
                        );
                      },
                    ),
                    space(h * 0.01),
                  ],
                )),
            space(h * 0.03),
            Container(
                height: h * 0.07,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Join Our\nCommunity",
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Row(children: [
                      InkWell(
                        onTap: () async {
                          // WebView(
                          //   initialUrl: "https://wa.me/message/TXHJ35JQFOMAK1",
                          //   javascriptMode: JavascriptMode.unrestricted,
                          //   navigationDelegate:
                          //       (NavigationRequest request) async {
                          //     if (request.url.startsWith(
                          //         'https://api.whatsapp.com/send?phone')) {
                          //       print('blocking navigation to $request}');
                          //       // List<String> urlSplitted =
                          //       //     request.url.split("&text=");

                          //       // String phone = "0123456789";
                          //       // String message = urlSplitted.last
                          //       //     .toString()
                          //       //     .replaceAll("%20", " ");

                          //       launchYoutube(
                          //           "https://wa.me/message/+919610046706");
                          //       return NavigationDecision.prevent;
                          //     }

                          //     print('allowing navigation to $request');
                          //     return NavigationDecision.navigate;
                          //   },
                          // );

                          int phone = 919610046706;
                          var whatsappUrl = "whatsapp://send?phone=$phone";
                          launchYoutube(whatsappUrl);
                          // launchYoutube("https://wa.me/message/+919610046706");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/whatsapp.svg",
                          width: 25,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          launchYoutube("https://instagram.com/picktask");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/instagram.svg",
                          width: 32,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          launchYoutube(
                              "https://linkedin.com/company/picktask");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/linkedin.svg",
                          width: 32,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          launchYoutube("https://facebook.com/picktask");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/facebook.svg",
                          width: 32,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          launchYoutube("https://twitter.com/picktask");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/twitter.svg",
                          width: 26,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          launchYoutube("https://youtube.com/@picktask");
                        },
                        child: SvgPicture.asset(
                          "assets/icon/youtube.svg",
                          width: 32,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          // The username or group ID of the Telegram account you want to open
                          final username = 'picktask';

                          // The message you want to send
                          final message = 'Hello, Welcome to picktask';
                          // format the url
                          final url = 'tg://resolve?domain=$username';

                          launchYoutube(url);

                          // int phone = 919610046706;
                          // var telegramurl = "https://t.me/send?phone=$phone";
                          // String url = "https://t.me/picktask";
                          // print("launchingUrl: $url");
                          // launchYoutube(url);
                        },
                        child: SvgPicture.asset(
                          "assets/icon/telegram.svg",
                          width: 28,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ])
                  ],
                )),
            space(h * 0.05),
          ],
        ),
      ),
    ));
  }
}

class AccountMenu extends StatelessWidget {
  Function() press;
  String title;
  String image;

  AccountMenu({required this.press, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(image,
                  color: kWhiteColor,
                  width: title == accountMenuList[0]["title"].toString()
                      ? 28
                      : title == accountMenuList[1]["title"].toString()
                          ? 25
                          : title == accountMenuList[2]["title"].toString()
                              ? 25
                              : title == accountMenuList[3]["title"].toString()
                                  ? 26
                                  : title ==
                                          accountMenuList[4]["title"].toString()
                                      ? 25
                                      : title ==
                                              accountMenuList[5]["title"]
                                                  .toString()
                                          ? 24
                                          : title ==
                                                  accountMenuList[6]["title"]
                                                      .toString()
                                              ? 20
                                              : title ==
                                                      accountMenuList[7]
                                                              ["title"]
                                                          .toString()
                                                  ? 20
                                                  : 28

                  // height: h * 0.03,
                  ),
              SizedBox(
                width: w * 0.03,
              ),
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.04,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: kWhiteColor,
          )
        ],
      ),
    );
  }
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
          // backgroundColor: kWhiteColor,
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
                            onPressed: () {
                              storage.erase();
                              storage.remove('token');
                              storage.remove('id');
                              storage.remove('role');
                              storage.remove('name');
                              storage.remove('first_name');
                              storage.remove('reffercode');
                              storage.remove('email');
                              storage.remove('last_name');
                              storage.remove('mobile');
                              storage.remove('profile_pic');
                              storage.remove('ranking');
                              storage.remove('earning');
                              storage.remove('total_wallet_amount');
                              storage.remove('current_wallet_amout');
                              storage.remove('status');

                              storage.remove('approve');
                              storage.remove('kyc_status');
                              Get.offAll(Login());
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
