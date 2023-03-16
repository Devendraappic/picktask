
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // for date format
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/screens/account/accountsController/accounts_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extensions.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';

class BankDetails extends StatefulWidget {
  String? name, gender, city, pincode,panNo, occupation, annualIncome, dob;

  BankDetails(
      {Key? key,
      this.name,
      this.gender,
      this.city,
      this.pincode,
      this.panNo,
      this.occupation,
      this.annualIncome,
      this.dob})
      : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  var accountsController = Get.put(AccountsController());


  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    accountsController.isLoading(false);
    return accountsController.isLoading.value==true?loader:Scaffold(body: Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space(h * 0.05),

            DefaultBackButton(),
            space(h * 0.01),
            if(kycStatus!=1)
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
                    color: Colors.yellow,
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      accountsController.bankProofTxt.value,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.043,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if(kycStatus==1){
                      return;
                    }
                    _showPicker(context, true, false);
                  },
                  child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      accountsController.panCardTxt.value,
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          color: kWhiteColor,
                          fontSize: w * 0.043,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if(kycStatus==1){
                      return;
                    }
                    _showPicker(context, false, true);
                  },
                  child: Container(
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
                ),
              ],
            ),
            space(h * 0.04),
            if(kycStatus!=1)
              Obx(() {
                return DefaultButton(
                    width: double.infinity,
                    height: h * 0.08,
                    text:
                    accountsController.actionButtonTextBankDetail.value,
                    radius: 15,
                    press: () {
                      if(kycStatus==0 ||kycStatus==1){
                        return;
                      }
                      if (accountsController.nameController.text == null || accountsController.nameController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterFullName);
                        return ;
                      }
                      if (accountsController.accountNumberController.text == null ||accountsController.accountNumberController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterAccountNumber);
                        return ;
                      }
                      if (accountsController.confirmAccountNumberController.text == null || accountsController.confirmAccountNumberController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterConfirmAccountNumber);
                        return ;
                      }
                      if (accountsController.accountNumberController.text != accountsController.confirmAccountNumberController.text) {
                        showToastMsg(AppStrings.txtConfirmAccountNumberDoesNotMatch);
                        return ;
                      }
                      if (accountsController.confirmAccountNumberController.text == null || accountsController.confirmAccountNumberController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterConfirmAccountNumber);
                        return ;
                      }
                      if (accountsController.ifscController.text == null || accountsController.ifscController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterIfscCode);
                        return ;
                      }
                      if (accountsController.bankController.text == null || accountsController.bankController.text.isEmpty) {
                        showToastMsg(AppStrings.txtEnterBankName);
                        return ;
                      }
                      String dobDate= widget.dob??"";
                      var formatttedDate;
                      if(dobDate.isNotEmpty){
                        final day= dobDate.split("-").first;
                        final month= dobDate.split("-")[1];
                        final year= dobDate.split("-").last;
                        formatttedDate= DateTime(int.parse(year),int.parse(month), int.parse(day));
                      }

                      accountsController
                          .updateKycDetails(
                        widget.name ?? "",
                        widget.gender ?? "",
                        widget.city ?? "",
                        widget.pincode ?? "",
                        widget.panNo ?? "",
                        widget.occupation ?? "",
                        widget.annualIncome ?? "",
                        formatttedDate.toString(),
                        accountsController.nameController.text,
                        accountsController.confirmAccountNumberController.text,
                        accountsController.ifscController.text,
                        accountsController.bankController.text,
                        accountsController.bankProofTxt.value=="Bank Proof(Optional)"?null:accountsController.bankProof.value,
                        accountsController.panCard.value,
                      )
                          .then((value) => {
                        if (value.data?.status == true)
                          {
                            if (accountsController
                                .actionButtonTextBankDetail
                                .value ==
                                AppStrings.txtSubmit)
                              {
                                accountsController
                                    .actionButtonTextBankDetail(
                                    AppStrings.txtPending)
                              }
                          }
                      });
                    });
              }),
            SizedBox(height: 20,)
          ],
        ),
      ),
    ),);
  }

  // full name textfield

  TextFormField nameFormField() {
    return TextFormField(
      readOnly: kycStatus==1?true:false,

      controller: accountsController.nameController,

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
      readOnly: kycStatus==1?true:false,

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: accountsController.accountNumberController,

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
      readOnly: kycStatus==1?true:false,

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: accountsController.confirmAccountNumberController,

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
      readOnly: kycStatus==1?true:false,

      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      controller: accountsController.ifscController,

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
      readOnly: kycStatus==1?true:false,

      controller: accountsController.bankController,

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

  void _showPicker(BuildContext context, bool isBankProof, bool isPan) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text(
                        "Photo Library",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: kBalckColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () async {
                        if (isBankProof) {
                          accountsController.bankProof.value = await _imgFromGallery();
                          accountsController.bankProofTxt.value= accountsController.bankProof.value.name;
                        } else if (isPan) {
                          accountsController.panCard.value = await _imgFromGallery();
                          accountsController.panCardTxt.value= accountsController.panCard.value.name;

                        }
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text(
                      "Camera",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: kBalckColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      if (isBankProof) {
                        accountsController.bankProof.value =
                            await _imgFromCamera();
                        accountsController.bankProofTxt.value= accountsController.bankProof.value.name;

                      } else if (isPan) {
                        accountsController.panCard.value =
                            await _imgFromCamera();
                        accountsController.panCardTxt.value= accountsController.panCard.value.name;

                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<File> _imgFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxHeight: 300,
      maxWidth: 300,
    );
    // final bytes = await pickedFile!.readAsBytes();
    return File(pickedFile?.path ?? "");
  }

  Future<File> _imgFromGallery() async {
    final pickedFile = await await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxHeight: 300,
      maxWidth: 300,
    );

    // final bytes = await pickedFile!.readAsBytes();
    return File(pickedFile?.path ?? "");
  }
}
