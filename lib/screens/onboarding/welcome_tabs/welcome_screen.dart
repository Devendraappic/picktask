import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/indicator.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/onboarding/login/ui/login.dart';
import 'package:picktask/screens/onboarding/register/ui/register.dart';

import '../../../utils/extra_widget.dart';
import 'welcome_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var onboardingController = Get.put(OnboardingController());
  final controller = PageController();

  int numberOfPages = 0;

  @override
  void initState() {
    onboardingController.getWelcomeScreenData();
    numberOfPages = onboardingController.getWelcomeScreenData().length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: <Widget>[
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              onboardingController.activeIndex(index);
              if (index == onboardingController.welcomeList.length - 1) {
                //todo
              }
            },
            itemCount: numberOfPages,
            itemBuilder: (BuildContext context, int index) {
              bool showSkip = true;
              if (index == 2) showSkip = false;
              return WelcomeTab(
                  onboardingController.welcomeList[index].title,
                  onboardingController.welcomeList[index].description,
                  onboardingController.welcomeList[index].imageUrl);
              ;
            },
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Obx(() {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onboardingController.activeIndex.value ==
                      onboardingController.welcomeList.length - 1)
                    Wrap(
                      children: [
                        DefaultButton(
                            width: w / 3,
                            height: h * 0.07,
                            text: "LOGIN",
                            radius: 15,
                            press: () {
                              Get.offAll(Login());
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        DefaultButton(
                            width: w / 3,
                            height: h * 0.07,
                            text: "REGISTER",
                            radius: 15,
                            press: () {
                              Get.offAll(Register());
                            }),
                      ],
                    ),
                  Visibility(
                    visible: onboardingController.activeIndex.value !=
                        onboardingController.welcomeList.length - 1,
                    child: DefaultButton(
                        width: w,
                        height: h * 0.07,
                        text: "NEXT",
                        radius: 15,
                        press: () {
                          controller.jumpToPage(
                              onboardingController.activeIndex.value + 1);
                        }),
                  )
                ],
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: Indicator(
                controller: controller,
                pageCount: numberOfPages,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
