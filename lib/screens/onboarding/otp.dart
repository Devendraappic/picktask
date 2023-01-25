// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/home/home.dart';
import 'package:picktask/screens/onboarding/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

import 'register.dart';

class Otp extends StatefulWidget {
  String number;
  Otp({required this.number});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  OnboardingController onboardingController =
      Get.put(OnboardingController(), permanent: false);

  String? otp;

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  bool isloading = false;

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  var tap = 0;
  var tap1 = 0;
  var tap2 = 0;
  var tap3 = 0;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  void previousField(String value, FocusNode focusNode) {
    if (value.length == 0) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(h * 0.09),
              // BackButton(),

              DefaultBackButton(),
              space(h * 0.07),
              Padding(
                padding: EdgeInsets.only(left: w * 0.04),
                child: Text(
                  "Verify",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.1,
                      fontWeight: FontWeight.w700),
                ),
              ),
              space(h * 0.015),
              Padding(
                padding: EdgeInsets.only(left: w * 0.04),
                child: Text(
                  "We have sent an OTP on your phone\n"
                  "number ${widget.number}",
                  style: GoogleFonts.poppins(
                      height: 1.5,
                      foreground: Paint()..shader = linearGradient,
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w600),
                ),
              ),

              space(h * 0.06),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 00),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
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
                        child: TextFormField(
                          maxLength: 1,
                          controller: first,
                          focusNode: pin1FocusNode,
                          autofocus: true,
                          obscureText: false,
                          style: GoogleFonts.poppins(
                              fontSize: 24, color: kWhiteColor),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: kPrimaryColor,

                            // fillColor: Colors.black,
                            filled: false,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            counterText: '',

                            hintStyle: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 1.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kWhiteColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhiteColor, width: 1.0)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),

                            prefixIconConstraints: BoxConstraints(minWidth: 4),
                          ),
                          onChanged: (value) {
                            nextField(value, pin2FocusNode);
                            //previousField(value, pin2FocusNode);
                          },
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
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
                        child: TextFormField(
                            maxLength: 1,
                            controller: second,
                            focusNode: pin2FocusNode,
                            obscureText: false,
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: kWhiteColor),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: kPrimaryColor,
                              // fillColor: Colors.black,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 16),
                              counterText: '',

                              hintStyle: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kWhiteColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kPrimaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kWhiteColor, width: 1.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0)),

                              prefixIconConstraints:
                                  BoxConstraints(minWidth: 4),
                            ),
                            onChanged: (value) {
                              if (value.toString().length == 0 && tap2 == 0) {
                                print("Print1");

                                tap2 = 1;
                              }
                              if (value.toString().length > 0) {
                                print("Print2");
                                FocusScope.of(context)
                                    .requestFocus(pin3FocusNode);
                              }
                              if (value.toString().length == 0 && tap2 == 1) {
                                print("Print3");
                                FocusScope.of(context)
                                    .requestFocus(pin1FocusNode);
                              }
                            }
                            ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
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
                        child: TextFormField(
                            maxLength: 1,
                            controller: third,
                            focusNode: pin3FocusNode,
                            obscureText: false,
                            style: GoogleFonts.poppins(
                                fontSize: 24, color: kWhiteColor),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: kPrimaryColor,
                              // fillColor: Colors.black,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 16),
                              counterText: '',

                              hintStyle: GoogleFonts.poppins(
                                  color: kWhiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                  width: 1.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kWhiteColor),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kPrimaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kWhiteColor, width: 1.0)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.0)),

                              prefixIconConstraints:
                                  BoxConstraints(minWidth: 4),
                            ),
                            onChanged: (value) {
                              if (value.toString().length == 0 && tap3 == 0) {
                                tap3 = 1;
                              }
                              if (value.toString().length > 0) {
                                FocusScope.of(context)
                                    .requestFocus(pin4FocusNode);
                              }
                              if (value.toString().length == 0 && tap3 == 1) {
                                FocusScope.of(context)
                                    .requestFocus(pin2FocusNode);
                              }
                            }),
                      ),
                      Container(
                        width: 60,
                        height: 60,
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
                        child: TextFormField(
                          maxLength: 1,
                          controller: fourth,
                          focusNode: pin4FocusNode,
                          obscureText: false,
                          style: GoogleFonts.poppins(
                              fontSize: 24, color: kWhiteColor),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: kPrimaryColor,
                            // fillColor: Colors.black,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            counterText: '',

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 1.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kWhiteColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: kPrimaryColor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: kWhiteColor, width: 1.0)),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0)),

                            prefixIconConstraints: BoxConstraints(minWidth: 4),
                          ),
                          onChanged: (value) {
                            if (value.toString().length == 0 && tap3 == 0) {
                              tap3 = 1;
                            }
                            if (value.toString().length > 0) {
                              FocusScope.of(context).unfocus();
                            }
                            if (value.toString().length == 0 && tap3 == 1) {
                              FocusScope.of(context)
                                  .requestFocus(pin3FocusNode);
                            }
                          },
                        ),
                      ),
                    ]),
              ),

              space(h * 0.03),

              Obx(() => onboardingController.isVerifyLoading.value
                  ? loader
                  : DefaultButton(
                      width: double.infinity,
                      height: h * 0.08,
                      text: "Submit",
                      press: () {
                        String sub =
                            "${first.text}${second.text}${third.text}${fourth.text}";
                        print("sub $sub");

                        if (sub.length == 4) {
                          onboardingController.verifyOtpApi(
                              widget.number.toString(), sub.toString());
                        } else {
                          Get.snackbar("Please enter 4 digit OTP", "",
                              colorText: kWhiteColor);
                        }
                      })),

              space(h * 0.06),

              Center(
                child: TextButton(
                  onPressed: () {
                    onboardingController.otpApi(widget.number);
                    first.clear();
                    second.clear();
                    third.clear();
                    fourth.clear();
                  },
                  child: Text(
                    "Resend OTP",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
