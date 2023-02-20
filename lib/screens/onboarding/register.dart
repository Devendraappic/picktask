// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/onboarding/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController refferalController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OnboardingController onboardingController =
  Get.put(OnboardingController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                space(h * 0.1),
                Text(
                  "We can't wait for you to join us!",
                  style: GoogleFonts.poppins(
                    color: Colors.yellow,
                      // foreground: Paint()
                      //   ..shader = linearGradient,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                space(h * 0.1),
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
                    child: nameFormField()),
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
                    child: emailFormField()),
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
                    child: passwordFormField()),
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
                    child: refferalFormField()),
                space(h * 0.02),
                Obx((() =>
                onboardingController.isLoading.value == true
                    ? loader
                    : DefaultButton(
                    width: double.infinity,
                    height: h * 0.08,
                    text: "Register",
                    radius: 15,
                    press: () {
                      if (nameController.text == null ||
                          nameController.text.isEmpty) {
                        showToastMsg('Please enter name');
                        return;
                      }
                      if (mobileController.text == null ||
                          mobileController.text.isEmpty) {
                        showToastMsg('Phone number is required');
                        return;
                      }
                      if (mobileController.text.length != 10) {
                        showToastMsg('Please enter valid phone number');
                        return;
                      }
                      if (emailController.text == null ||
                          emailController.text.isEmpty) {
                        showToastMsg('Email address or UniqueId is required');
                        return;
                      }
                      if (!GetUtils.isEmail(emailController.text)) {
                        showToastMsg('Please enter vaild email address ');
                        return;
                      }
                      if (passwordController.text == null ||
                          passwordController.text.isEmpty) {
                        showToastMsg('please enter password');
                        return;
                      }

                      onboardingController.signupApi(
                          nameController.text.trim(),
                          mobileController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          refferalController.text.trim() == ''
                              ? ""
                              : refferalController.text.trim());
                    }))),
                space(h * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.04,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.offAll(Login());
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                            foreground: Paint()
                              ..shader = linearGradient,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                space(h * 0.1),
                Text(
                  "Terms of use & Privacy Policy",
                  style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.04,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // full name textfield

  TextFormField nameFormField() {
    return TextFormField(
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: nameController,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
      ],

      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Full Name ",
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
          child: Icon(
            Icons.person_rounded,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// mobile number textfield

  TextFormField mobileFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

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
          child: Icon(
            Icons.phone,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// email textfield
  TextFormField emailFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: emailController,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Email ",
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
          child: Icon(
            Icons.mail_outline,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// password textfield
  TextFormField passwordFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: passwordController,

      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,

        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Password ",
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
          child: Icon(
            Icons.lock,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// refferal code textfield

  TextFormField refferalFormField() {
    return TextFormField(
      controller: refferalController,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Refferal Code (Optional)",
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
              "assets/icons/percentage.svg",
              width: w * 0.07,
              color: kWhiteColor,
            )),
      ),
    );
  }
}
