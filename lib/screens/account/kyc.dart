// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/back_button.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/controller/accountsController/accounts_controller.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/onboarding/login.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Kyc extends StatefulWidget {
  @override
  State<Kyc> createState() => _KycState();
}

class _KycState extends State<Kyc> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  TextEditingController nameController = TextEditingController();
  var accountsController= Get.put(AccountsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              space(h * 0.05),

              DefaultBackButton(),
              space(h * 0.01),
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
                  "Please complete kyc to withdraw your payout",
                  style: GoogleFonts.poppins(
                    color:Colors.yellow,
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
              Obx( () {
                  return InkWell(
                    onTap: () {
                      accountsController.selectDate(context);
                     // calendarModelBottomSheet();
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
                            width: w * 0.03,
                          ),
                          Icon(
                            Icons.cake,
                            color: kWhiteColor,
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
                  );
                }
              ),
              space(h * 0.02),
              DefaultButton(
                  width: double.infinity,
                  height: h * 0.08,
                  text: "Verify",
                  radius: 15,
                  press: () {
                    Get.to(() => BankDetails(), transition: Transition.rightToLeft);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // full name textfield
  TextFormField nameFormField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Email address or UniqueId is required';
        }
        // if (!GetUtils.isEmail(val)) {
        //   return 'Email address ';
        // }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      // controller: emailController,

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
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Email address or UniqueId is required';
        }
        // if (!GetUtils.isEmail(val)) {
        //   return 'Email address ';
        // }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      // controller: emailController,

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
          child: Icon(
            Icons.location_city,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

  // pincode textfiled
  TextFormField pincodeFormField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Email address or UniqueId is required';
        }
        // if (!GetUtils.isEmail(val)) {
        //   return 'Email address ';
        // }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      // controller: emailController,

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
          child: Icon(
            Icons.location_city,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }

  // . pan number textfield
  TextFormField panNumbnerFormField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Email address or UniqueId is required';
        }
        // if (!GetUtils.isEmail(val)) {
        //   return 'Email address ';
        // }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,
      // controller: emailController,

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
          child: Icon(
            Icons.person_rounded,
            color: kWhiteColor,
          ),
        ),
      ),
    );
  }
}

class GenderDrop extends StatelessWidget {
  RxString dropdownValue = "Select Gender".obs;

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
            width: w * 0.03,
          ),
          Icon(
            Icons.male,
            color: kWhiteColor,
            size: 30,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: kPrimaryColor,
                  elevation: 0,
                  iconDisabledColor: kWhiteColor,
                  iconEnabledColor: kWhiteColor,

                  // Initial Value
                  value: dropdownValue.value,

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
                    dropdownValue.value = newValue!;
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class OccupationDrop extends StatelessWidget {
  RxString dropdownValue = "Occupation".obs;

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
            width: w * 0.03,
          ),
          Icon(
            Icons.male,
            color: kWhiteColor,
            size: 30,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: kPrimaryColor,
                  elevation: 0,
                  iconDisabledColor: kWhiteColor,
                  iconEnabledColor: kWhiteColor,

                  // Initial Value
                  value: dropdownValue.value,

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
                    dropdownValue.value = newValue!;
                  },
                ),
              )),
        ],
      ),
    );
  }
}

class AnnualIncomeDrop extends StatelessWidget {
  RxString dropdownValue = "Annual Income".obs;

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
            width: w * 0.03,
          ),
          Icon(
            Icons.payment,
            color: kWhiteColor,
            size: 30,
          ),
          SizedBox(
            width: w * 0.03,
          ),
          Obx(() => DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: kPrimaryColor,
                  elevation: 0,
                  iconDisabledColor: kWhiteColor,
                  iconEnabledColor: kWhiteColor,

                  // Initial Value
                  value: dropdownValue.value,

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
                    dropdownValue.value = newValue!;
                  },
                ),
              )),
        ],
      ),
    );
  }

  // calander bottomsheet

}
