// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/controller/accountsController/accounts_controller.dart';
import 'package:picktask/screens/account/kyc.dart';
import 'package:picktask/screens/onboarding/login/ui/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {

  var accountsController= Get.put(AccountsController());
  TextEditingController nameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController confirmAccountNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space(h * 0.05),
              // BackButton(),

              DefaultBackButton(),
              space(h * 0.01),
              Text(
                "Submit Your Bank Details!",
                style: GoogleFonts.cabin(
                    color: kWhiteColor,
                    fontSize: w * 0.055,
                    fontWeight: FontWeight.w700),
              ),
              space(h * 0.015),
              Center(
                child: Text(
                  "You will receive your payout only on this account.",
                  style: GoogleFonts.poppins(
                      color:Colors.yellow,
                      //foreground: Paint()..shader = linearGradient,
                      fontSize: w * 0.04,
                      fontWeight: FontWeight.w600),
                ),
              ),
              space(h * 0.04),
              nameFormField(),
              space(h * 0.02),
              accountNumberFormField(),
              space(h * 0.02),
              confirmAccountNumberFormField(),
              space(h * 0.02),
              ifscCodeFormField(),
              space(h * 0.02),
              bankNameFormField(),
              space(h * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h * 0.07,
                    width: w * 0.64,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Bank Proof(Optional)",
                        style: GoogleFonts.cabin(
                            color: kWhiteColor,
                            fontSize: w * 0.043,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.07,
                    width: w * 0.25,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.photo_camera,
                      size: 33,
                    )),
                  ),
                ],
              ),
              space(h * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h * 0.07,
                    width: w * 0.64,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Upload Pan Card Image",
                        style: GoogleFonts.cabin(
                            color: kWhiteColor,
                            fontSize: w * 0.043,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.07,
                    width: w * 0.25,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.photo_camera,
                      size: 33,
                    )),
                  ),
                ],
              ),
              space(h * 0.04),
              Obx( () {
                  return DefaultButton(
                      width: double.infinity,
                      height: h * 0.08,
                      text: accountsController.actionButtonTextBankDetail.value,
                      radius: 15,
                      press: () {
                        if( accountsController.actionButtonTextBankDetail.value==AppStrings.txtSubmit){
                          accountsController.actionButtonTextBankDetail(AppStrings.txtPending);
                        }
                        // if (nameController.text == null || nameController.text.isEmpty) {
                        //   showToastMsg(AppStrings.txtEnterFullName);
                        //   return ;
                        // }
                        // if (accountNumberController.text == null || accountNumberController.text.isEmpty) {
                        //  showToastMsg(AppStrings.txtEnterAccountNumber);
                        //   return ;
                        // }
                        // if (confirmAccountNumberController.text == null || confirmAccountNumberController.text.isEmpty) {
                        //   showToastMsg(AppStrings.txtEnterConfirmAccountNumber);
                        //   return ;
                        // }
                        // if (accountNumberController.text != confirmAccountNumberController.text) {
                        //   showToastMsg(AppStrings.txtConfirmAccountNumberDoesNotMatch);
                        //   return ;
                        // }
                        // if (confirmAccountNumberController.text == null || confirmAccountNumberController.text.isEmpty) {
                        //   showToastMsg(AppStrings.txtEnterConfirmAccountNumber);
                        //   return ;
                        // }
                        // if (ifscController.text == null || ifscController.text.isEmpty) {
                        //   showToastMsg(AppStrings.txtEnterIfscCode);
                        //   return ;
                        // }
                        // if (bankController.text == null || bankController.text.isEmpty) {
                        //   showToastMsg(AppStrings.txtEnterBankName);
                        //   return ;
                        // }

                      });
                }
              ),
            ],
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

      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Full Name ",
        hintStyle: TextStyle(
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

  // account number textfiled

  TextFormField accountNumberFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: accountNumberController,

      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Account Number",
        hintStyle: TextStyle(
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
            Icons.account_balance,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// confirm account number textfield

  TextFormField confirmAccountNumberFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: confirmAccountNumberController,

      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Confirm Account Number",
        hintStyle: TextStyle(
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
            Icons.account_balance,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// ifsc textfield

  TextFormField ifscCodeFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: ifscController,

      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "IFSC Code",
        hintStyle: TextStyle(
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
            Icons.account_balance,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

// bank name

  TextFormField bankNameFormField() {
    return TextFormField(

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: bankController,

      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Bank Name",
        hintStyle: TextStyle(
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
            Icons.account_balance,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
