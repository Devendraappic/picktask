// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/onboarding/otp.dart';
import 'package:picktask/screens/onboarding/register.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/images.dart';

class LoginWithOtp extends StatelessWidget {
  RxBool obsecure = false.obs;

  TextEditingController mobileController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OnboardingController onboardingController =
      Get.put(OnboardingController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      child: SingleChildScrollView(
        child: Obx((() => Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(h * 0.03),
                  Lottie.asset(
                    'assets/icons/llogin.json',
                  ),
                  Text(
                    "Login To Continue Picktask",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.03,
                        fontWeight: FontWeight.w400),
                  ),
                  space(h * 0.02),
                  Container(
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
                      child: mobileFormField()),
                  space(h * 0.02),
                  onboardingController.isLoading.value
                      ? loader
                      : DefaultButton(
                          width: double.infinity,
                          height: h * 0.08,
                          text: "GET OTP",
                      radius: 15,
                          press: () {
                            if (mobileController.text.isNotEmpty &&
                                mobileController.text.length == 10) {
                              Get.to(Otp(number: mobileController.text.trim()));

                              onboardingController
                                  .otpApi(mobileController.text.trim())
                                  .then((value) => false);
                            } else {
                              Get.snackbar("Please enter 10 digit number", "",
                                  colorText: kWhiteColor);
                            }
                          }),
                  space(h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        width: w * 0.38,
                        color: kWhiteColor,
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Text(
                        "OR",
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      Container(
                        height: 0.5,
                        width: w * 0.38,
                        color: kWhiteColor,
                      )
                    ],
                  ),
                  space(h * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: h * 0.08,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(width: 0.7, color: kWhiteColor),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Login With Password",
                          style: GoogleFonts.poppins(
                              color: kWhiteColor,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                  space(h * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.cabin(
                            color: kWhiteColor,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Register());
                        },
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.cabin(
                              foreground: Paint()..shader = linearGradient,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))),
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
      controller: mobileController,

      maxLength: 10,

      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.phone,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Mobile Number ",
        hintStyle: GoogleFonts.poppins(
            color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
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
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor, width: 1.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0)),

        prefixIconConstraints: BoxConstraints(minWidth: 4),

        prefixIcon: Padding(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              mobile_icon,
              color: kWhiteColor,
              width: 20,
            )),
      ),
    );
  }
}

// TextEditingController myController, TextInputType keyboardType, String hint, Icon newIcon

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.yellow, Color(0xffB3713C)],
).createShader(Rect.fromLTRB(0, 20, 200, 200));
