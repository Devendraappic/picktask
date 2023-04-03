import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/main.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/onboarding/login/ui/login.dart';
import 'package:picktask/screens/onboarding/welcome_tabs/welcome_screen.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/images.dart';
import 'package:picktask/utils/local_storage.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({super.key});

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    getLoginStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBalckColor,
      body: Center(
        child: Image.asset(
          logo1,
          width: w * 0.7,
        ),
      ), // picktask logo and this url take from images.dart in utils  folder
    );
  }

  getLoginStatus() async {
    print("isLogin::$isLogin \nmy....token :$firebaseToken");

    Future.delayed(Duration(seconds: 3), () {
      if (isLogin == true && firebaseToken?.isNotEmpty == true) {
        Get.offAll(() => HomeNav(
              index: 0.obs,
            ));
      } else {
        Get.offAll(() => WelcomeScreen());
      }
    });
  }
}
