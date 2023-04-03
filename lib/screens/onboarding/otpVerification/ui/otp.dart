import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/screens/onboarding/otpVerification/controller/otp_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class Otp extends StatefulWidget {
  String number;

  Otp({required this.number});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> with SingleTickerProviderStateMixin {
  var oTpVerificationController = Get.put(OTPVerificationController());

  late Timer timer;
  late int remainingTime;
  late int timerTime;
  late bool connectionState;
  TextEditingController? textEditingController1;

  String _comingSms = 'Unknown';
  String otp="";

  Future<void> initSmsListener() async {

    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    setState(() {
      _comingSms = comingSms??"";
      print("====>Message: ${_comingSms}");
      print("${_comingSms[32]}");
      textEditingController1?.text = _comingSms[16] + _comingSms[17] + _comingSms[18] + _comingSms[19]; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
    });
  }
  @override
  void initState() {
    super.initState();

    remainingTime = 60;
    timerTime = 60;
    connectionState = true;
    initTimer();
    textEditingController1 = TextEditingController();
    initSmsListener();
  }

  initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = timerTime - timer.tick;
      if (remainingTime <= 0) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    textEditingController1?.dispose();
    AltSmsAutofill().unregisterListener();
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
                  "Enter OTP to verify your mobile number +91-${widget.number}",
                  style: GoogleFonts.poppins(
                      height: 1.5,
                      color: Colors.yellow,
                      // foreground: Paint()..shader = linearGradient,
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w600),
                ),
              ),
              space(h * 0.06),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                      selectedColor:Colors.grey,
                      selectedFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      activeColor: Colors.grey
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: textEditingController1,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    if (v.length == 4) {
                      oTpVerificationController.verifyOTP(context,
                          v, widget.number.toString());
                    } else {
                      showToastMsg("Please enter 4 digit OTP");
                    }
                    //do something or move to next screen when code complete
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      print('$value');
                      otp=value;
                    });
                  },
                ),
              ),
              space(h * 0.03),
              Obx(() => oTpVerificationController.isLoading.value == true
                  ? loader
                  : DefaultButton(
                      width: double.infinity,
                      height: h * 0.08,
                      text: "Submit",
                      radius: 15,
                      press: () {
                        print("sub $otp");

                        if (otp.length == 4) {
                          oTpVerificationController.verifyOTP(context,
                              otp.toString(), widget.number.toString());
                        } else {
                          showToastMsg("Please enter 4 digit OTP");
                        }
                      })),
              space(h * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  remainingTime == 0
                      ? GestureDetector(
                    onTap: () {
                      otp="";
                      oTpVerificationController
                          .sendOTP(context, widget.number)
                          .then((value) {
                            remainingTime=60;
                            initTimer();


                      });
                    },
                    child:  Text(
                      "Resend OTP",
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                      : RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.w500),
                      text: "Resend OTP in ",
                      children: <InlineSpan>[
                        TextSpan(
                          text: "${remainingTime}s",
                            style: GoogleFonts.poppins(
                                color: kWhiteColor,
                                fontSize: w * 0.04,
                                fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
