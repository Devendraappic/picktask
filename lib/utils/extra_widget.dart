import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/utils/color.dart';
import 'package:url_launcher/url_launcher.dart';

// loading indicator
const loader = Center(
    child: CircularProgressIndicator.adaptive(
  strokeWidth: 1,
  backgroundColor: Colors.orange,
));

// height and width
var h = Get.height;
var w = Get.width;

// scroll controller
final ScrollController scrollController = ScrollController();

// space

Widget space(double? height, [double? width]) {
  return SizedBox(
    height: height,
    width: width,
  );
}

// lauch url

void launchYoutube(var url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
  // print("launchingUrl: hgh");

  // if (await canLaunch(url.toString())) {
  //   await launch(url.toString());
  // }
}
