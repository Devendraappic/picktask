// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:picktask/screens/account/account.dart';
import 'package:picktask/screens/earning/earning.dart';
import 'package:picktask/screens/home/home.dart';
import 'package:picktask/screens/leads/category.dart';
import 'package:picktask/screens/leads/leads.dart';
import 'package:picktask/screens/leads/savings.dart';
import 'package:picktask/screens/task/task.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/images.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:picktask/utils/method.dart';

class HomeNav extends StatefulWidget {
  RxInt index;
  HomeNav({
    required this.index,
  });

  @override
  State<HomeNav> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<HomeNav> {
  ProfileController profileController =
      Get.put(ProfileController(), permanent: false);

  @override
  void initState() {
    super.initState();

    profileController._selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          body: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (s) => IndexedStack(
              index: s.selectedIndex,
              children: const <Widget>[
                Home(),
                Leads(),
                Category(),
                Earning(),
                Account()
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: kBlueColor,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                primaryColor: Colors.red,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: TextStyle(color: Colors.yellow))),
            child: SuperFaBottomNavigationBar(),
          ),
        ));
  }
}

class SuperFaBottomNavigationBar extends StatelessWidget {
  ProfileController profileController =
      Get.put(ProfileController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      // init only first time
      builder: (s) => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          // Explore
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: SvgPicture.asset(
                earning_icon, // explore icon
                width: 18,
                color: profileController._selectedIndex == 0.obs
                    ? kWhiteColor
                    : kWhiteColor,
              ),
            ),
            label: "Home",
          ),

          //groups
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  earning_icon, // groups icon
                  width: 18,
                  color: profileController._selectedIndex == 1.obs
                      ? kWhiteColor
                      : kWhiteColor,
                ),
              ),
              label: "Leads"),

          // category
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  earning_icon, //categories icon
                  width: 18,
                  color: profileController._selectedIndex == 2.obs
                      ? kWhiteColor
                      : kWhiteColor,
                ),
              ),
              label: "Task"),

          // marketplace
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  earning_icon, // marketplace icon
                  width: 18,
                  color: profileController._selectedIndex == 3.obs
                      ? kWhiteColor
                      : kWhiteColor,
                ),
              ),
              label: "Earning"),

          // account / me
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 3.0),
                child: SvgPicture.asset(
                  account_icon, // account/me icon
                  width: 20,
                  color: profileController._selectedIndex == 4.obs
                      ? kWhiteColor
                      : kWhiteColor,
                ),
              ),

              //Menu
              label: "My Account")
        ],
        currentIndex: s.selectedIndex,
        selectedItemColor: kWhiteColor,
        unselectedItemColor:kWhiteColor ,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) => s.onItemTapped(index),
        /* currentIndex: Get.find<ProfileController>().selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: Get.find<ProfileController>().onItemTapped, */
      ),
    );
  }
}

class ProfileController extends GetxController {
//  LearningPathIndex learningPathIndexController =
//       Get.put(LearningPathIndex(), permanent: false);

  late RxInt _selectedIndex = 0.obs;
  set selectedIndex(value) => this._selectedIndex.value = value;
  get selectedIndex => this._selectedIndex.value;

  onItemTapped(int index) {
    // learningPathIndexController.isShowIndex = 0.obs;

    this.selectedIndex =
        index; // The set method is accessed this way, you have confused it with methods.
    update();
  }
}
