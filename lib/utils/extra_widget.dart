import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/utils/color.dart';

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

// snackbar



