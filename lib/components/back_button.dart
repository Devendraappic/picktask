import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class DefaultBackButton extends StatelessWidget {
  @override
  Widget build(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(

          padding: EdgeInsets.only(right: 20,),

          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: kWhiteColor,
              ))),
    );
  }
}
