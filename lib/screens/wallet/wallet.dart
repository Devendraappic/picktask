import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: h * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(w * 0.11),
                bottomRight: Radius.circular(w * 0.11),
              ),
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(top: h * 0.06),
                child: Center(
                  child: Text(
                    "Hello TUSHAR",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.065,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.notifications,
                    size: w * 0.1,
                    color: kWhiteColor,
                  ),
                ),
              )
            ]),
          ),
          space(h * 0.01),
        ]),
      ),
    );
  }
}
