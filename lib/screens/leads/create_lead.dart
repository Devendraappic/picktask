import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/default_button.dart';
import 'package:picktask/components/savings_card.dart';
import 'package:picktask/screens/leads/controller/create_lead_controller.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extra_widget.dart';

class CreateLead extends StatefulWidget {
  const CreateLead({Key? key}) : super(key: key);

  @override
  State<CreateLead> createState() => _CreateLeadState();
}

class _CreateLeadState extends State<CreateLead> {
  var createLeadsController= Get.put(CreateLeadController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Create Lead",
          style: GoogleFonts.cabin(
              color: kWhiteColor,
              fontSize: w * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx((() => Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                height: h * 0.12,
                width: double.infinity,
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
                child: Row(
                  children: [
                    Container(
                      height: w * 0.14,
                      width: w * 0.14,
                      decoration: BoxDecoration(shape: BoxShape.rectangle, color: kWhiteColor),
                      child: Center(
                          child: Image.asset(
                            "assets/images/sbi_logo.png",
                            width: 50,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "You're creating lead for SBI Bank credit card",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.045,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),

              space(h * 0.01),


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
                  child: pinCodeField()),
              space(h * 0.02),
              space(h * 0.02),
              createLeadsController.isLoading.value
                  ? loader
                  : DefaultButton(
                  width: double.infinity,
                  height: h * 0.08,
                  text: "Submit",
                  radius: 15,
                  press: () {
                   if (formKey.currentState!.validate()) {
                     showLeadSubmitDialog();
                   }
                  }),
              space(h * 0.1),
            ],
          ),
        ))),
      ),
    );
  }
  showLeadSubmitDialog(){
    Get.defaultDialog(
      radius: 12,
      content:Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: kWhiteColor),
              child: Center(
                  child: Image.asset(
                    "assets/images/check.png",
                    width: 80,
                  )),
            ),
          ),
          SizedBox(
            height: h * 0.1,
          ),
          Expanded(child: Text(
            'Success! Your lead was submitted successfully. We will validate your lead. It will take some time.',
            textAlign: TextAlign.center,)),

          SizedBox(
            height: h * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: (){
                Get.back(closeOverlays: true);
              },
              child: Container(

                  padding: const EdgeInsets.symmetric(horizontal:15, vertical: 6),
                  decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child:Text("Okay", style: TextStyle(color: Colors.white),)
              ),
            ),
          ),

        ],
      ),
    );
  }

  // full name textfield

  TextFormField nameFormField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Customer name is required';
        }

        return null;
      },
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


      ),
    );
  }

// mobile number textfield

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


      ),
    );
  }


  // mobile number textfield

  TextFormField pinCodeField() {
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Pin code is required';
        }
        if (val.length != 6) {
          return 'Please enter valid pin Code';
        }
        return null;
      },
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      controller: pinCodeController,

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
        hintText: "Pin Code",
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


      ),
    );
  }



}
