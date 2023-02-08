// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/controller/onboarding/onboarding_controller.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/onboarding/login_with_otp.dart';
import 'package:picktask/screens/onboarding/register.dart';
import 'package:picktask/testing/color_change.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  RxBool obsecure = true.obs;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OnboardingController onboardingController =
      Get.put(OnboardingController(), permanent: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController.text = "bhim.appic@gmail.com";
    passwordController.text = "111111";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      child: SingleChildScrollView(
        child: Obx((() => Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(h * 0.25),
                  // Lottie.asset(
                  //   'assets/icons/llogin.json',
                  // ),
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.05,
                        fontWeight: FontWeight.w700),
                  ),
                  space(h * 0.01),
                  Text(
                    "Please login to continue",
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
                  onboardingController.isLoading.value
                      ? loader
                      : DefaultButton(
                          width: double.infinity,
                          height: h * 0.08,
                          text: "Login",
                          radius: 15,
                          press: () {
                            // Get.to(() => MyApp());
                            if (formKey.currentState!.validate()) {
                              Get.offAll(HomeNav(index: 0.obs));

                              onboardingController
                                  .loginApi(
                                      emailController.text.toString().trim(),
                                      passwordController.text.toString().trim())
                                  .then((value) => false);
                            }
                          }),
                  space(h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        width: w * 0.4,
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
                        width: w * 0.35,
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
                          Get.to(LoginWithOtp());
                        },
                        child: Text(
                          "Login With OTP",
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
                          Get.offAll(Register());
                        },
                        child: Text(
                          "Register Now",
                          style: GoogleFonts.poppins(
                              foreground: Paint()..shader = linearGradient,
                              fontSize: w * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  space(h * 0.1),
                ],
              ),
            ))),
      ),
    ));
  }

  TextFormField emailFormField() {
    return TextFormField(
      controller: emailController,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Email address or UniqueId is required';
        }
        if (!GetUtils.isEmail(val)) {
          return 'Please enter vaild email address ';
        }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      // controller: emailController,
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

  TextFormField passwordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: obsecure.value,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter password';
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: obsecure.value
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: kWhiteColor,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: kWhiteColor,
                ),
          onPressed: () {
            obsecure.value = !obsecure.value;
          },
        ),

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
}

// TextEditingController myController, TextInputType keyboardType, String hint, Icon newIcon

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.yellow, Color(0xffB3713C)],
).createShader(Rect.fromLTRB(0, 20, 200, 200));
