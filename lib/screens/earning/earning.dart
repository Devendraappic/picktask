// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/dot_seperator.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';

List a = [1, 2, 4, 7, 9, 10, 12, 34, 65, 21, 78, 56];
List b = [];
List c = [];

class Earning extends StatefulWidget {
  const Earning({super.key});

  @override
  State<Earning> createState() => _EarningState();
}

class _EarningState extends State<Earning> {
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            height: h * 0.15,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(w * 0.11),
                bottomRight: Radius.circular(w * 0.11),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.01),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lifetime Earning",
                          style: GoogleFonts.poppins(
                              color: kWhiteColor,
                              fontSize: w * 0.055,
                              fontWeight: FontWeight.w600),
                        ),
                        space(h * 0.0),
                        Text(
                          "₹100",
                          style: GoogleFonts.poppins(
                              color: kWhiteColor,
                              fontSize: w * 0.05,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.wallet,
                          size: w * 0.1,
                          color: kWhiteColor,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          space(h * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Balance",
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.055,
                            fontWeight: FontWeight.w600),
                      ),
                      space(h * 0.005),
                      Text(
                        "₹100",
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.wallet,
                        size: w * 0.1,
                        color: kWhiteColor,
                      ),
                    ),
                  )
                ]),
          ),
          space(h * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kWhiteColor),
                  child: Center(child: mobileFormField()),
                ),

                // mobileFormField(),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    if (amountController.text.isEmpty) {
                      showToastMsg('Enter withdrawal amount');
                      return ;
                    }
                    if (double.parse(amountController.text) < 100) {
                      showToastMsg('Min withdrawal amount is ₹100');
                      return ;
                    }
                    showWithdrawalSuccessDialog(context);
                    print("length: ${a.length}");
                    int remain = int.parse(amountController.text);
                    int cd = remain;
                    b.add(remain);
                    var cs = b.reversed;

                    print("ammount: ${amountController.text}");

                    a.remove(remain);
                    a.sort((a, b) => a - b);

                    print(a);
                    // b.add(remain);
                    a.insertAll(0, cs);

                    print(a);

                    print(a.length);

                    for (var i = 0; i < a.length; i += 3) {
                      c.add([a[i], a[i + 2]]);
                    }
                    print(c);
                  },
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kBlueColor),
                    child: Center(
                      child: Text(
                        "Withdraw",
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          space(h * 0.02),
          MySeparator(
            color: Colors.white,
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            controller: scrollController,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: h * 0.02),
                child: EarningCard(),
              );
            },
          ),
          EarningCard()
        ],
      ),
    ));
  }

  TextFormField mobileFormField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Phone number is required';
        }
        if (val.length != 10) {
          return 'Please enter valid phone number';
        }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      controller: amountController,

      maxLength: 10,

      style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.phone,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        counterText: '',
        hintText: "Enter Amount",
        hintStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor, width: 1.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0)),

        prefixIconConstraints: BoxConstraints(minWidth: 4),
      ),
    );
  }
}

class EarningCard extends StatelessWidget {
  const EarningCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 0.05),
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      height: h * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Box decoration takes a gradient
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
      child: Row(
        children: [
          Image.asset(
            "assets/images/savings.png",
            width: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SBI Credit Card 2 Lead",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "22 Nov 2022 12: 00 PM",
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: h * 0.03,
                width: w * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    // stops: [0.1, 0.4, 0.7, 0.9],
                    colors: const [
                      // Colors are easy thanks to Flutter's Colors class.
                      Colors.yellow,
                      Colors.orange,
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Success",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "+ ₹100",
                  style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontSize: w * 0.035,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "TXN01",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.035,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  abc() {
    for (var i = 0; i < a.length; i += 2) {
      c.add([a[i], a[i + 1]]);
    }
    print(c);
  }
}
