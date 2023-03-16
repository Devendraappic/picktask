// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picktask/components/webView.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/account/accountsController/accounts_controller.dart';
import 'package:picktask/screens/account/kycDetails/ui/bank_detail.dart';
import 'package:picktask/screens/account/changePassword/ui/change_password.dart';
import 'package:picktask/screens/account/help_and_support.dart';
import 'package:picktask/screens/account/idCard/ui/id_card.dart';
import 'package:picktask/screens/account/kycDetails/ui/kyc.dart';
import 'package:picktask/screens/account/referAndEarn/ui/refer_and_earn.dart';
import 'package:picktask/screens/onboarding/login/ui/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/hex_color.dart';
import 'package:picktask/utils/local_list.dart';
import 'package:picktask/utils/local_storage.dart';

import '../../utils/extra_widget.dart';

class Account extends StatefulWidget {
   const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final picker = ImagePicker();
  var accountsController= Get.put(AccountsController());
  String kycStatusTxt="Pending";
  Future<void> _pullRefresh() async {
    accountsController.getMyAccountDetail();
  }
  @override
  Widget build(BuildContext context) {
    accountsController.isLoading(false);
    accountsController.getMyAccountDetail();
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: Obx(() {
        if(kycStatus==4){
          kycStatusTxt = "Rejected";
        }if(kycStatus==3){
          kycStatusTxt = "Not Updated";
        }if(kycStatus==2){
          kycStatusTxt = "In-Progress";
        }if(kycStatus==1){
          kycStatusTxt = "Completed";
        }if(kycStatus==0){
          kycStatusTxt = "Pending";
        }

        //kycStatus=> 3=not updated, 2="in-progress",1='approved' , 0='pending', 4='reject'

        return accountsController.isLoading.value==true?loader:Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  space(h * 0.07),
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 51,
                            backgroundColor: getColorFromHex("#DCDCDC"),
                            child: accountsController.profilePic.value.path.isNotEmpty==true?ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                accountsController.profilePic.value,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ): profilePic?.isNotEmpty==true?ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                profilePic??"",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ): CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  child: Icon(Icons.person, size: 40,),
                                  radius: 40,
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){

                              _showPicker(context);
                            },
                            child: Center(
                                child: Icon(Icons.camera_alt, size: 25,)
                            ),
                          )
                        ]),
                  ),
                  space(h * 0.02),
                  Text(
                    name??"",
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
                            //width: w * 0.25,
                            padding: EdgeInsets.symmetric(horizontal: 10),
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
                                kycStatusTxt,
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
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: 5),
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
                      child: Wrap(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                                int phone = 916367688928;
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
                                "assets/icon/twitter_icon.svg",
                                width: 26,
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
      ),
    );
  }

   void _showPicker(BuildContext context) {
     showModalBottomSheet(
         context: context,
         builder: (BuildContext bc) {
           return SafeArea(
             child: Container(
               color: Colors.white,
               child: Wrap(
                 children: <Widget>[
                   ListTile(
                       leading: Icon(Icons.photo_library),
                       title: Text(
                         "Photo Library",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.poppins(
                             color: kBalckColor,
                             fontSize: 16,
                             fontWeight: FontWeight.w500),
                       ),
                       onTap: ()  {
                         _imgFromGallery();
                         Navigator.of(context).pop();
                       }),
                   ListTile(
                     leading: Icon(Icons.photo_camera),
                     title: Text(
                       "Camera",
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                           color: kBalckColor,
                           fontSize: 16,
                           fontWeight: FontWeight.w500),
                     ),
                     onTap: () async {
                       _imgFromCamera();
                       Navigator.of(context).pop();
                     },
                   ),
                 ],
               ),
             ),
           );
         });
   }

    _imgFromCamera() async {
     final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 300,
       maxWidth: 300,);

       if (pickedFile != null) {
         accountsController.changeProfilePic( File(pickedFile.path));
       } else {
         print('No image selected.');
       }

   }

    _imgFromGallery() async {
     final pickedFile = await  await picker.pickImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 300,
       maxWidth: 300,);

       if (pickedFile != null) {


         accountsController.changeProfilePic( File(pickedFile.path));
       } else {
         print('No image selected.');
       }

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
              Image.asset(image,
                  color: kWhiteColor,
                width: 22,
                  height: 22,
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

