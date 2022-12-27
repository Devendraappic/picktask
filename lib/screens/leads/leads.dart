import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';

class Leads extends StatelessWidget {
  const Leads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text(
        "Leads",
        style: TextStyle(color: kWhiteColor),
      )),
    );
  }
}
