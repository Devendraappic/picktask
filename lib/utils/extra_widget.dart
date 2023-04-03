import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
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
Future<void> launchYoutube(var url) async {
  Uri fbBundleUri = Uri.parse(url);
  try {
    bool launched = await launchUrl(fbBundleUri,  mode: LaunchMode.externalApplication); // Launch the app if installed!

    if (!launched) {
      launchUrl(fbBundleUri); // Launch web view if app is not installed!
    }
  } catch (e) {
    showToastMsg("Oops! Invalid webinar link!");
    launchUrl(fbBundleUri); // Launch web view if app is not installed!
  }
}
