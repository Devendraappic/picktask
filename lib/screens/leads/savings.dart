// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/savings_card.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class SavingsAccount extends StatefulWidget {
  const SavingsAccount({super.key});

  @override
  State<SavingsAccount> createState() => _SavingsAccountState();
}

class _SavingsAccountState extends State<SavingsAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Savings Account",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
            child: SavingsCard(),
          );
        },
      ),
    );
  }
}
