import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';

class Earning extends StatelessWidget {
  const Earning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text(
        "Earning",
        style: TextStyle(color: kWhiteColor),
      )),
    );
  }
}
