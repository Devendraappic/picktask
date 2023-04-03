// ignore_for_file: prefer_const_constructors, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/screens/account/accountsController/accounts_controller.dart';
import 'package:picktask/screens/account/kycDetails/ui/bank_detail.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extensions.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Kyc extends StatefulWidget {
  @override
  State<Kyc> createState() => _KycState();
}

class _KycState extends State<Kyc> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;


  var accountsController = Get.put(AccountsController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_)async {
      var kycData= await accountsController.getKycDetail();
      var unescape = HtmlUnescape();

      if(kycData.data?.kycStatus==1){
        accountsController.nameOnPanController.text=kycData.data?.nameOnpencard??"";
        accountsController.cityController.text=kycData.data?.city??"";
        accountsController.pinCodeController.text=kycData.data?.pincode??"";
        accountsController.panNumberController.text=kycData.data?.penCard??"";
       accountsController.gender.value= kycData.data?.gender?.capitalizeText()??"";
        accountsController.occupation.value= kycData.data?.occupation??"";
       accountsController.annualIncome.value= unescape.convert(kycData.data?.annualIncome??"");
       accountsController.selectedDay.value= kycData.data?.dob??"";
       accountsController.nameController.text= kycData.data?.accountHolderName??"";
       accountsController.accountNumberController.text= kycData.data?.accountNumber??"";
       accountsController.confirmAccountNumberController.text= kycData.data?.accountNumber??"";
       accountsController.ifscController.text= kycData.data?.ifscCode??"";
       accountsController.bankController.text= kycData.data?.bankName??"";

      }


    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => /*accountsController.isLoading.value==true?loader: */Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              space(h * 0.05),
              DefaultBackButton(),
              if(accountsController.kycStatus.value!=1)
              space(h * 0.01),
              if(accountsController.kycStatus.value!=1)
                Text(
                  "Complete Your KYC!",
                  style: GoogleFonts.cabin(
                      color: kWhiteColor,
                      fontSize: w * 0.055,
                      fontWeight: FontWeight.w700),
                ),
              space(h * 0.015),
              Center(
                child: Text(
                  accountsController.kycStatus.value==1?"Your KYC is completed":"Please complete kyc to withdraw your payout",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      // foreground: Paint()..shader = linearGradient,
                      fontSize: w * 0.04,
                      fontWeight: FontWeight.w600),
                ),
              ),
              space(h * 0.02),
              nameFormField(),
              space(h * 0.02),
              GenderDrop(),
              space(h * 0.02),
              cityFormField(),
              space(h * 0.02),
              pincodeFormField(),
              space(h * 0.02),
              panNumbnerFormField(),
              space(h * 0.02),
              OccupationDrop(),
              space(h * 0.02),
              AnnualIncomeDrop(),
              space(h * 0.02),
              InkWell(
                onTap: () {
                  if(accountsController.kycStatus.value==1){
                    return;
                  }
                  accountsController.selectDate(context);
                },
                child: Container(
                  height: h * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Image.asset(
                        "assets/icons/dob_icon.png",
                        color: kWhiteColor,
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Text(
                        accountsController.selectedDay.toString(),
                        style: GoogleFonts.cabin(
                            color: kWhiteColor,
                            fontSize: w * 0.043,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              space(h * 0.02),
              DefaultButton(
                  width: double.infinity,
                  height: h * 0.08,
                  text: accountsController.kycStatus.value==1?"Next":"Verify",
                  radius: 15,
                  press: () {
                    if (accountsController.nameOnPanController.text == null ||
                        accountsController.nameOnPanController.text.trim().isEmpty) {
                      showToastMsg(AppStrings.txtEnterFullName);
                      return;
                    }
                    if (accountsController.gender.value ==
                        AppStrings.selectGender) {
                      showToastMsg(AppStrings.selectGender);
                      return;
                    }
                    if (accountsController.cityController.text == null ||
                        accountsController.cityController.text.trim().isEmpty) {
                      showToastMsg(AppStrings.enterCity);
                      return;
                    }
                    if (accountsController.pinCodeController.text == null ||
                        accountsController.pinCodeController.text.trim().isEmpty) {
                      showToastMsg(AppStrings.pinCode);
                      return;
                    }
                    if (accountsController.panNumberController.text == null ||
                        accountsController.panNumberController.text.trim().isEmpty) {
                      showToastMsg(AppStrings.panNumber);
                      return;
                    }
                    if (accountsController.occupation.value ==
                        AppStrings.occupation) {
                      showToastMsg(AppStrings.occupation);
                      return;
                    }
                    if (accountsController.annualIncome.value ==
                        AppStrings.annualIncome) {
                      showToastMsg(AppStrings.annualIncome);
                      return;
                    }
                    if (accountsController.selectedDay.value ==
                        AppStrings.dob) {
                      showToastMsg(AppStrings.dob);
                      return;
                    }
                    Get.to(
                            () => BankDetails(
                            name: accountsController.nameOnPanController.text,
                            gender: accountsController.gender.value,
                            city: accountsController.cityController.text,
                            pincode: accountsController.pinCodeController.text,
                            panNo: accountsController.panNumberController.text,
                            occupation: accountsController.occupation.value,
                            annualIncome: accountsController.annualIncome.value,
                            dob: accountsController.selectedDay.value),
                        transition: Transition.rightToLeft);
                  }),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    ));
  }

  // full name textfield
  TextFormField nameFormField() {
    return TextFormField(
      readOnly: accountsController.kycStatus.value==1?true:false,
      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      controller: accountsController.nameOnPanController,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Full Name (As Per PAN) ",
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

// city textfield
  TextFormField cityFormField() {

    return TextFormField(
      readOnly: accountsController.kycStatus.value==1?true:false,
      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      controller: accountsController.cityController,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "City",
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
          child: Image.asset(
            "assets/icons/city.png",
            color: kWhiteColor,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }

  // pincode textfiled
  TextFormField pincodeFormField() {
    return TextFormField(
      controller: accountsController.pinCodeController,
      readOnly: accountsController.kycStatus.value==1?true:false,
      style: TextStyle(
          color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
      //keyboardType: TextInputType.emailAddress,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        counterText: '',
        hintText: "Pincode",
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
          child: Image.asset(
            "assets/icons/pincode.png",
            color: kWhiteColor,
            width: 25,
            height: 25,
          ),
        ),
      ),
    );
  }

  // . pan number textfield
  TextFormField panNumbnerFormField() {
    return TextFormField(
      readOnly: accountsController.kycStatus.value==1?true:false,
      controller: accountsController.panNumberController,
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
        hintText: "Pan Number",
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
          child: Image.asset(
            "assets/icons/pan_card.png",
            color: kWhiteColor,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}

class GenderDrop extends StatelessWidget {
  var accountsController = Get.find<AccountsController>();

  RxList<String> dropdownList =
      <String>["Select Gender", "Male", "Female", "Others"].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: w * 0.04,
          ),
          Image.asset(
            "assets/icons/gender.png",
            color: kWhiteColor,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          IgnorePointer(
            ignoring: accountsController.kycStatus.value==1?true:false,
            child: Obx(() => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: kPrimaryColor,
                    elevation: 0,
                    iconDisabledColor: kWhiteColor,
                    iconEnabledColor: kWhiteColor,

                    // Initial Value
                    value: accountsController.gender.value,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: dropdownList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(color: kWhiteColor),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      accountsController.gender(newValue.toString());
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class OccupationDrop extends StatelessWidget {
  var accountsController = Get.find<AccountsController>();
  RxList<String> dropdownList = <String>[
    "Occupation",
    "Financial Advisor",
    "Student",
    "Sales Agent",
    "Govt Employee",
    "Youtuber Or Influencer",
    "Business Owner",
    "Housewife",
    "Bank Employee",
    "Farmer",
    "Private Job",
    "Not Working",
    "Others"
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: w * 0.04,
          ),
          Image.asset(
            "assets/icons/occupation.png",
            color: kWhiteColor,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          IgnorePointer(
            ignoring: accountsController.kycStatus.value==1?true:false,
            child: Obx(() => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: kPrimaryColor,
                    elevation: 0,
                    iconDisabledColor: kWhiteColor,
                    iconEnabledColor: kWhiteColor,

                    // Initial Value
                    value: accountsController.occupation.value,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: dropdownList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(color: kWhiteColor),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      accountsController.occupation(newValue.toString());
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class AnnualIncomeDrop extends StatelessWidget {
  var accountsController = Get.find<AccountsController>();
  RxList<String> dropdownList = <String>[
    "Annual Income",
    "₹0-1 Lakh",
    "₹1-2.5 Lakh",
    "₹2.5-5 Lakh",
    "₹5+ Lakhs",
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: w * 0.04,
          ),
          Image.asset(
            "assets/icons/annual_income.png",
            color: kWhiteColor,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          IgnorePointer(
            ignoring: accountsController.kycStatus.value==1?true:false,

            child: Obx(() => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: kPrimaryColor,
                    elevation: 0,
                    iconDisabledColor: kWhiteColor,
                    iconEnabledColor: kWhiteColor,

                    // Initial Value
                    value: accountsController.annualIncome.value,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: dropdownList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(color: kWhiteColor),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      accountsController.annualIncome(newValue.toString());
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
