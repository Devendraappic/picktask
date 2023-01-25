import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/main.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/onboarding/login.dart';
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
    var firstTime = true;

    firstTime = storage.read("isFirstTimeLaunch") ?? true;
    var myToken = storage.read('token');
    print("my....token :$myToken^");

    Future.delayed(Duration(seconds: 3), () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => IntdroductionScreen()));

      myToken.toString() == "" || myToken.toString() == "null" || myToken == ''
          ? firstTime != null
              ? firstTime
                  ? Get.offAll(() => Login())
                  : Get.offAll(() => Login())
              : Get.offAll(() => Login())
          : myToken.toString() == '72'
              ? Get.offAll(() => Login())
              : Get.offAll(() => HomeNav(
                    index: 0.obs,
                  ));
    });
  }
}
