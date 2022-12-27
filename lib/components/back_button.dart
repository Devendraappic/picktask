import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class DefaultBackButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
        height: h * 0.05,
        width: h * 0.05,
        margin: EdgeInsets.only(right: w * 0.8),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kBalckColor,
            )));
  }
}
