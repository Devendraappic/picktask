// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/leads_card.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class Leads extends StatelessWidget {
  const Leads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Leads",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: 5,
                 shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int position){
                return Container(
                  margin: EdgeInsets.only(right: 5, bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(2))
                  ),
                  child: Center(child: Text("All", style: TextStyle(color: Colors.white),)),);
              }),
            ),
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 14, left: w * 0.05, right: w * 0.05),
                  child: LeadsCard(),
                );
              },
            ),
            SizedBox(
              height: h * 0.1,
            ),
            Container(
                height: w * 0.16,
                width: w * 0.16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    // stops: [0.1, 0.4, 0.7, 0.9],
                    colors: const [
                      // Colors are easy thanks to Flutter's Colors class.
                      Color(0xFF2B252A),
                      Color(0xFF1F2131),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: w * 0.13,
                  color: kBlueColor,
                )),
          ],
        ),
      ),
    );
  }
}
