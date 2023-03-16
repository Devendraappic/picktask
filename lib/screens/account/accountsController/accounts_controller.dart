import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picktask/constants/app_strings.dart';
import 'package:picktask/main.dart';
import 'package:picktask/model/onboarding/welcome_tab.dart';
import 'package:picktask/network/retrofit/api_client.dart';
import 'package:picktask/screens/account/kycDetails/model/kyc_detail_response.dart';
import 'package:picktask/screens/account/kycDetails/model/kyc_update_response.dart';
import 'package:picktask/screens/account/model/faq_model.dart';
import 'package:picktask/components/home_nav.dart';
import 'package:picktask/screens/account/kycDetails/ui/bank_detail.dart';
import 'package:picktask/screens/account/model/my_account_response.dart';
import 'package:picktask/screens/account/model/update_profile_pic_response.dart';
import 'package:picktask/screens/onboarding/otpVerification/ui/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class AccountsController extends GetxController {
  var actionButtonTextBankDetail = "".obs;
  var faqList = <FAQsModel>[].obs;
  var selectedDay = "Date of Birth".obs;
  var annualIncome = "Annual Income".obs;
  var occupation = "Occupation".obs;
  var gender = "Select Gender".obs;
  var bankProofTxt = "Bank Proof(Optional)".obs;
  var panCardTxt = "Upload Pan Card Image".obs;

  var isLoading = false.obs;
  final client = ApiClient();
  Rx<File> bankProof = File('').obs;
  Rx<File> panCard = File('').obs;
  Rx<File> profilePic = File('').obs;

  //kyc page text controllers..
  TextEditingController nameOnPanController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController confirmAccountNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  @override
  void onInit() {
    actionButtonTextBankDetail.value = AppStrings.txtSubmit;
    getFaqList();
    super.onInit();
  }

  List<FAQsModel> getFaqList() {
    faqList.clear();
    faqList.add(FAQsModel(
        title: "How To Change My Bank Details?",
        description:
            "Please drop us an email with your new bank details. Our team will review and change the details within 48 hours."));
    faqList.add(FAQsModel(
        title: "How To Complete KYC Details?",
        description:
            "You can update your KYC details from my KYC section under my account."));

    faqList.add(FAQsModel(
        title: "How does my kyc details will be verified?",
        description:
            "once you submit your kyc details it will take 48 hours to validate your details once validated it will be approved."));

    faqList.add(FAQsModel(
        title: "Why my KYC got rejected?",
        description:
            "Make sure you entered all the details correctly. Once your kyc is rejected, you can update it again for approval."));

    faqList.add(FAQsModel(
        title: "Why is my pan card and bank details mandatory?",
        description:
            "Pan Card and Bank Details are mandatory because your commission will be credited in this bank account."));

    faqList.add(FAQsModel(
        title: "Why My Lead Is Still Pending?",
        description:
            "It will take minimum 48 hours or more, as the case may be for validating."));

    faqList.add(FAQsModel(
        title: "Why My Lead Got Rejected?",
        description:
            "Make sure you have entered correct details while creating the lead, or your customer has completed all necessary steps."));

    faqList.add(FAQsModel(
        title: "What is the ideal lead tracking time?",
        description:
            "Ideally, it will take 48 hours expect holidays to validate your leads, but this time is not the same for all tasks. Some tasks can take upto 7 working days for validation."));

    faqList.add(FAQsModel(
        title: "I have applied for a task and it is showing pending",
        description:
            "Once you apply for any task, you have to wait a minimum of 30-60 minutes. Later, you can drop a message us on WhatsApp for faster approval."));

    faqList.add(FAQsModel(
        title: "How much time need to get my commission?",
        description:
            "Once your lead gets approved, you will receive a commission within 3 to 7 working days."));

    faqList.add(FAQsModel(
        title: "How To Refer a Friend?",
        description:
            "You can share your referral code with your friends to refer. You will get your referral code on my referral page."));

    faqList.add(FAQsModel(
        title: "Why I Haven't Received Referral Amount?",
        description:
            "If the user does not convert any lead, then you will not be eligible for referral income."));

    faqList.add(FAQsModel(
        title: "How Can I Increase My Sales?",
        description:
            "You can join our webinar on 'Improve Your Sales Skills' to improve your sales skills. This webinar runs daily on PickTask."));

    faqList.add(FAQsModel(
        title: "What is PickTask Big Saving Days?",
        description:
            "PickTask Big Savings Days runs on every Sunday and Monday. On These Days You Will Get an Extra 10% Commission On All Products."));

    faqList.add(FAQsModel(
        title: "When I will receive PickTask Big Saving Days commission?",
        description:
            "Once your lead gets approved, you will receive your commission within 3 to 7 working days in your wallet."));

    faqList.add(FAQsModel(
        title: "How can I earn extra income from my refferals?",
        description:
            "If your customer actives on PickTask, then you will get an extra 10% of your customer's income."));

    faqList.add(FAQsModel(
        title: "How To Stay Updated With Latest Contests and offers?",
        description:
            "Connect with us on our social media platforms and WhatsApp for the latest offers and updates."));

    faqList.add(FAQsModel(
        title: "How Much Money I Can Earn From PickTask?",
        description:
            "You can earn 50,000 in a month from PicTask by completing tasks."));

    return faqList;
  }

  openDialer(String phoneNumber) async {
    Uri callUrl = Uri.parse('tel:=$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      throw 'Could not open the dialler.';
    }
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1900),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      var outputFormat = DateFormat('MM-dd-yyyy');
      var outputDate = outputFormat.format(picked);
      selectedDay(outputDate.toString());
    }
  }

  changeProfilePic(File file) {
    profilePic(file);
    updateProfilePic(profilePic.value);
  }

  Future<UpdateProfilePicResponse> updateProfilePic(File image) async {
    var response = UpdateProfilePicResponse();
    isLoading(true);
    try {
      response = await client.updateProfile(userId ?? 0, image);
    } catch (e, s) {
      print("error==> $s");
      isLoading(false);
    }
    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      isLoading(false);
      showToastMsg(response.msg ?? "");
      getMyAccountDetail();
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }

  Future<MyAccountResponse> getMyAccountDetail() async {
    isLoading(true);
    var response = await client.myAccountRequest(userId ?? 0);

    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      await storage.write('name', response.data?.name ?? "");
      await storage.write('partner_id', response.data?.partnerId ?? "");

      await storage.write('reffercode', response.data?.refCode ?? "");

      await storage.write('profile_pic', response.profilepic ?? "");

      await storage.write('kyc_status', response.kycStatus ?? 0);

      isLoading(false);

      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }

  Future<KycDetailResponse> getKycDetail() async {
    isLoading(true);
    var response = await client.getKYCDetails(userId ?? 0);

    debugPrint("apiResponse------->" + response.msg.toString());
    if (response.status == true) {
      await storage.write('kyc_status', response.data?.kycStatus ?? 0);
      isLoading(false);
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.msg ?? "");
    }
    return response;
  }

  Future<KycUpdateModel> updateKycDetails(
      String nameOnPan,
      String gender,
      String city,
      String pincode,
      String panNumber,
      String occupation,
      String annualIncome,
      String dob,
      String acHolder,
      String acNo,
      String ifsc,
      String bankName,
      File? bankProof,
      File pencard) async {
    var response = KycUpdateModel();

    try {
      response = await client.updateKyc(
          userId ?? 0,
          nameOnPan,
          gender,
          city,
          pincode,
          panNumber,
          occupation,
          annualIncome,
          dob,
          acHolder,
          acNo,
          ifsc,
          bankName,
          bankProof,
          pencard);
    } catch (e, s) {
      print("error==> $s");
      isLoading(false);
    }
    debugPrint("apiResponse------->" + response.message!);
    if (response.data?.status == true) {
      isLoading(false);

      showToastMsg("Your KYC Details Submitted Successfully.");

      Get.offAll(HomeNav(index: 4.obs));
      return response;
    } else {
      isLoading(false);
      showToastMsg(response.message ?? "");
    }
    return response;
  }
}
