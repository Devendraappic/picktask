import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/image_view.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/account/idCard/controller/id_card_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:math' as math;

import 'package:share_plus/share_plus.dart';

class IdCard extends StatefulWidget {
  const IdCard({super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  var idCardController = Get.put(IdCardController());
  Uint8List? _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    idCardController.getIdCardDetail(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return idCardController.isLoading.value==true?loader:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              "ID Card",
              style: GoogleFonts.poppins(
                  color: kWhiteColor,
                  fontSize: w * 0.05,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Screenshot(
                controller: screenshotController,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff5240D4),
                          Color(0xff6F5EFC),
                          Color(0xff5240D4),
                        ]),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ImageView(
                              imageUrl: idCardController.idCardResponse.value.data?.profilePic ?? "",
                              isCircular: true,
                              radius: 35,
                              width: 80.0,
                              height: 80.0,
                              errorWidget: const CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                    radius: 40,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                           ( idCardController.idCardResponse.value.data?.name ?? "").toUpperCase(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                foreground: Paint()..shader = linearGradient,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Sales Partner",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Partner ID: ${ idCardController.idCardResponse.value.data?.partnerId}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_in_talk_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                idCardController.idCardResponse.value.data?.mobile ?? "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.email_sharp,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                idCardController.idCardResponse.value.data?.email ?? "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: kWhiteColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/logo_transparent.png",
                                width: 90),
                            Row(
                              children: [
                                Image.asset("assets/images/power.png",
                                    width: 15, height: 15, color: Colors.yellow),
                                Text(
                                  "Growwings Solution",
                                  style: GoogleFonts.openSans(
                                      color: kWhiteColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  width: double.infinity,
                  height: h * 0.08,
                  text: "Share",
                  radius: 15,
                  leadingIcon: Transform.rotate(
                      angle: -math.pi / 4,
                      child: Icon(
                        Icons.link_sharp,
                        color: Colors.white,
                        size: 20,
                      )),
                  press: () async {
                    await screenshotController
                        .capture()
                        .then((Uint8List? image) async {
                      if (image != null) {
                        final directory = await getApplicationDocumentsDirectory();
                        final imagePath =
                            await File('${directory.path}/image.png').create();
                        await imagePath.writeAsBytes(image);

                        /// Share Plugin
                        await Share.shareFiles([imagePath.path]);
                      }
                    });
                    screenshotController.capture().then((Uint8List? image) {
                      //Capture Done
                      setState(() {
                        _imageFile = image;
                      });
                    }).catchError((onError) {
                      print(onError);
                    });
                  })
            ]),
          ),
        );
      }
    );
  }
}
