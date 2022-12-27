import 'package:flutter/material.dart';
import 'package:picktask/utils/color.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
          child: Text(
        "Account",
        style: TextStyle(color: kWhiteColor),
      )),
    );
  }
}
