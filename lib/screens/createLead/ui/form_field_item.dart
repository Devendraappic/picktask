import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/screens/createLead/controller/create_lead_controller.dart';
import 'package:picktask/screens/createLead/model/create_lead_form_model.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/extensions.dart';

class CustomFormField extends StatelessWidget {
  LeadFormData fieldData;
  CreateLeadController createLeadController;

  CustomFormField({
    Key? key,
    required this.fieldData,
    required this.createLeadController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget fieldWidget;
    switch (fieldData.value) {
      case "text":
        fieldData.fieldTextController = TextEditingController();
        fieldWidget = TextFormField(
          controller: fieldData.fieldTextController,
          style: GoogleFonts.poppins(
              color: kWhiteColor, fontSize: 16, fontWeight: FontWeight.w400),
          keyboardType: TextInputType.text,
          cursorColor: kWhiteColor,
          decoration: InputDecoration(
            fillColor: kPrimaryColor,
            filled: false,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            counterText: '',
            hintText: fieldData.field,
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
        break;
      case "file":
        fieldData.fieldTextController = TextEditingController();

        fieldWidget = Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: fieldData.fieldTextController,
                style: GoogleFonts.poppins(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                keyboardType: TextInputType.text,
                cursorColor: kWhiteColor,
                decoration: InputDecoration(
                  fillColor: kPrimaryColor,
                  filled: false,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  counterText: '',
                  hintText: fieldData.field,
                  hintStyle: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
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
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                            allowCompression: true,
                            allowedExtensions: [
                              // 'pdf',
                              // 'doc',
                              'png',
                              'jpeg',
                              'jpg',
                            ],
                            type: FileType.custom);

                    if (result != null) {
                      var _path = result.files.single.path;
                      File file = File(_path ?? "");
                      fieldData.fieldValue = _path ?? "";
                      (fieldData.fieldTextController as TextEditingController)
                          .text = file.name;
                    } else {
                      // User canceled the picker
                    }
                  },
                  icon: Icon(
                    Icons.file_upload_sharp,
                    color: kWhiteColor,
                  )),
            )
          ],
        );
        break;
      default:
        fieldWidget = const SizedBox();
        break;
    }
    return fieldWidget;
  }
}
