// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class ChangePassword extends StatelessWidget {
  RxBool oldobsecure = false.obs;
  RxBool newobsecure = false.obs;
  RxBool confirmobsecure = false.obs;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "My Leads",
          style: GoogleFonts.poppins(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(children: [
          oldpasswordFormField(),
          space(h * 0.02),
          newpasswordFormField(),
          space(h * 0.02),
          confirmpasswordFormField(),
          space(h * 0.03),
          DefaultButton(
              width: double.infinity,
              height: h * 0.07,
              text: "Update Password",
              radius: 15,
              press: () {})
        ]),
      ),
    );
  }

  TextFormField oldpasswordFormField() {
    return TextFormField(
      controller: oldPasswordController,
      obscureText: oldobsecure.value,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter old password';
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: oldobsecure.value
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: kWhiteColor,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: kWhiteColor,
                ),
          onPressed: () {
            oldobsecure.value = !oldobsecure.value;
          },
        ),

        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Old Password ",
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

  TextFormField newpasswordFormField() {
    return TextFormField(
      controller: newPasswordController,
      obscureText: newobsecure.value,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter new password';
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: newobsecure.value
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: kWhiteColor,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: kWhiteColor,
                ),
          onPressed: () {
            newobsecure.value = !newobsecure.value;
          },
        ),

        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "New Password ",
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

  TextFormField confirmpasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: oldobsecure.value,
      style: GoogleFonts.poppins(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter confirm password';
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: oldobsecure.value
              ? const Icon(
                  Icons.visibility_off_outlined,
                  color: kWhiteColor,
                )
              : const Icon(
                  Icons.visibility_outlined,
                  color: kWhiteColor,
                ),
          onPressed: () {
            oldobsecure.value = !oldobsecure.value;
          },
        ),

        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Confirm Password",
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
