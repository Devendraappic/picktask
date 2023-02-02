import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/onboarding/splash.dart';

void main() async {
  runApp(const Picktask());

  // System overlay used for change the app status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));

  OnboardingController();
}

var storage = GetStorage();

class Picktask extends StatefulWidget {
  const Picktask({Key? key}) : super(key: key);

  @override
  _PicktaskState createState() => _PicktaskState();
}

class _PicktaskState extends State<Picktask> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        // initialBinding: AllControllerBinding(),

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(backgroundColor: Colors.black)),
        title: "Picktask",
        home: const Spalsh());
  }
}
