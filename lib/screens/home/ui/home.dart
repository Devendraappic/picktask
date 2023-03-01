// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/slider.dart';
import 'package:picktask/components/webinar_card.dart';
import 'package:picktask/screens/home/controller/home_controller.dart';

import 'package:picktask/testing/map_testing.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';

import '../../notifications/ui/notification_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController(), permanent: false);
  @override
  void initState() {
    homeController.getHomePageData(userId??0);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: h * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(w * 0.11),
                bottomRight: Radius.circular(w * 0.11),
              ),
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.06),
                child: Center(
                  child: Text(
                    "Hello $firstName",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.065,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Positioned(
                top: 30, right: 8,
                child: InkWell(
                  onTap: (){
                    Get.to(()=>NotificationList());
                  },
                  child:  Icon(
                    Icons.notifications,
                    size: w * 0.1,
                    color: kWhiteColor,
                  ),
                ),
              )
            ]),
          ),
          space(h * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
              children: [
                Obx(() {
                    return homeController.response.value.data?.topbaner?.isNotEmpty==true?CustomSliderWidget(items: homeController.response.value.data?.topbaner??[]):SizedBox();
                  }
                ),
                space(h * 0.02),
                InkWell(
                  onTap: () {
                    Get.to(() => MapTesting());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                    height: h * 0.1,
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
                        Container(
                          height: w * 0.14,
                          width: w * 0.14,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: kBlueColor),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/earnings.svg",
                              width: 29,
                              color: kWhiteColor,
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
                              "My Lifetime Earnings",
                              style: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "₹${earning}",
                              style: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: w * 0.045,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                space(h * 0.02),
                Row(
                  children: [
                    Container(
                      width: w * 0.15,
                      height: h * 0.036,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          "Live",
                          style: GoogleFonts.poppins(
                              color: kWhiteColor,
                              fontSize: w * 0.055,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Text(
                      "Training Webinar",
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Obx(() {
                    return homeController.response.value.data?.webinar?.isNotEmpty==true?LimitedBox(
                      maxHeight: h * 0.17,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount:homeController.response.value.data?.webinar?.length,
                          shrinkWrap: true,
                          controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: WebinarCard(webinar:homeController.response.value.data?.webinar?[index] ,),
                            );
                          },
                        ),
                      ),
                    ):SizedBox();
                  }
                ),

                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  height: h * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/banner_offer.jpeg"),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
