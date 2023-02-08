import 'dart:convert';

import 'package:get/get.dart';
import 'package:picktask/main.dart';
import 'package:picktask/model/onboarding/welcome_tab.dart';
import 'package:picktask/screens/home/home_nav.dart';
import 'package:picktask/screens/account/bank_detail.dart';
import 'package:picktask/screens/onboarding/otp.dart';

import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';
import 'package:http/http.dart' as http;

class OnboardingController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isVerifyLoading = false.obs;
  var welcomeList=<WelcomeModel>[].obs;
  var activeIndex = 0.obs;
  // login api

  Future loginApi(
    String email,
    String password,
  ) async {
    isLoading(true);

    var res = await http.post(Uri.parse(login_url),
        body: {"email": email, "password": password});
    print('inside login Function');

    if (res.statusCode == 200) {
      isLoading(true);
      var data = jsonDecode(res.body);
      if (data['success'] == true) {
        await storage.write('is_login', true);
        await storage.write('token', data['data']["token"]);
        await storage.write('id', data['data']["Data"]['id'].toString());
        await storage.write('role', data['data']["Data"]['role'].toString());
        await storage.write('name', data['data']["Data"]['name'].toString());
        await storage.write(
            'first_name', data['data']["Data"]['first_name'].toString());
        await storage.write(
            'reffercode', data['data']["Data"]['ref_code'].toString());
        await storage.write('email', data['data']["Data"]['email'].toString());
        await storage.write(
            'last_name', data['data']["Data"]['last_name'].toString());
        await storage.write(
            'mobile', data['data']["Data"]['mobile'].toString());
        await storage.write(
            'profile_pic', data['data']["Data"]['profile_pic'].toString());
        await storage.write(
            'ranking', data['data']["Data"]['ranking'].toString());
        await storage.write(
            'earning', data['data']["Data"]['earning'].toString());
        await storage.write('total_wallet_amount',
            data['data']["Data"]['total_wallet_amount'].toString());
        await storage.write('current_wallet_amout',
            data['data']["Data"]['current_wallet_amout'].toString());
        await storage.write(
            'status', data['data']["Data"]['status'].toString());
        await storage.write(
            'approve', data['data']["Data"]['approve'].toString());
        await storage.write(
            'kyc_status', data['data']["Data"]['kyc_status'].toString());

        // Get.offAll(() => HomeNav(
        //       index: 0.obs,
        //     ));
        print("mytoken: ${data['data']["token"]}");
        Get.snackbar("Welcome to Picktask", "", colorText: kWhiteColor);

        print("id ${data['data']["Data"]['id'].toString()}");

        isLoading(false);

        return data;
      } else {
        isLoading(false);

        Get.snackbar(data['message'], "", colorText: kWhiteColor);
      }
    } else {
      isLoading(false);
      return Future.error('Server Error!');
    }
  }

  // register api

  Future<dynamic> signupApi(String name, String mobile, String email,
      String password, String refferal) async {
    isLoading.value = true;
    var res = await http.post(Uri.parse(register_url), body: {
      "full_name": name,
      "mobile": mobile,
      "email": email,
      "password": password,
      "referal_code": refferal,
    });

    if (res.statusCode == 200) {
      isLoading.value = true;
      var data = jsonDecode(res.body);

      if (data['success'] == true) {
        await storage.write('token', data['data']["token"]);
        await storage.write('id', data['data']["userData"]['id'].toString());
        await storage.write(
            'role', data['data']["userData"]['role'].toString());
        await storage.write(
            'name', data['data']["userData"]['name'].toString());
        await storage.write(
            'first_name', data['data']["userData"]['first_name'].toString());
        await storage.write(
            'email', data['data']["userData"]['email'].toString());
        await storage.write(
            'last_name', data['data']["userData"]['last_name'].toString());
        await storage.write(
            'mobile', data['data']["userData"]['mobile'].toString());
        await storage.write(
            'profile_pic', data['data']["userData"]['profile_pic'].toString());
        await storage.write(
            'ranking', data['data']["userData"]['ranking'].toString());
        await storage.write(
            'earning', data['data']["userData"]['earning'].toString());
        await storage.write('total_wallet_amount',
            data['data']["userData"]['total_wallet_amount'].toString());
        await storage.write('current_wallet_amout',
            data['data']["userData"]['current_wallet_amout'].toString());
        await storage.write(
            'status', data['data']["userData"]['status'].toString());
        await storage.write(
            'approve', data['data']["userData"]['approve'].toString());
        await storage.write(
            'kyc_status', data['data']["userData"]['kyc_status'].toString());

        Get.to(
            () => Otp(
                  number: mobile,
                ),
            transition: Transition.fadeIn);
        Get.snackbar(data['message'], "", colorText: kWhiteColor);

        isLoading.value = false;
      } else {
        isLoading.value = false;

        Get.snackbar(data['msg'].toString(), "", colorText: kWhiteColor);
      }
    } else {
      isLoading.value = false;
    }
  }

  // otp api

  Future<dynamic> otpApi(String mobile) async {
    isLoading.value = true;
    var res = await http.post(Uri.parse(otp_url), body: {
      "mob_no": mobile,
    });

    if (res.statusCode == 200) {
      isLoading.value = true;
      var data = jsonDecode(res.body);

      if (data['status'] == true) {
        // Get.to(Otp(number: mobile));

        Get.snackbar(data['msg'], "", colorText: kWhiteColor);

        isLoading.value = false;
      } else {
        isLoading.value = false;
        Get.snackbar(data['msg'], "", colorText: kWhiteColor);
      }
    } else {
      isLoading.value = false;
    }
  }

  /// verifiy otp

  Future<dynamic> verifyOtpApi(String mobile, String otp) async {
    isVerifyLoading.value = true;
    var res = await http
        .post(Uri.parse(verify_otp_url), body: {"mob_no": mobile, "otp": otp});

    if (res.statusCode == 200) {
      isVerifyLoading.value = true;
      var data = jsonDecode(res.body);

      if (data['status'] == true) {
        Get.offAll(HomeNav(index: 0.obs));

        Get.snackbar("Welcome to Picktask", "", colorText: kWhiteColor);

        isVerifyLoading.value = false;
      } else {
        isVerifyLoading.value = false;
        Get.snackbar(data['msg'].toString(), "", colorText: kWhiteColor);
      }
    } else {
      isVerifyLoading.value = false;
    }
  }

  List<WelcomeModel> getWelcomeScreenData() {
    welcomeList.clear();
    welcomeList.add(WelcomeModel("Welcome to PickTask",
        "We can't wait for you to join us.", "https://picsum.photos/400"));
    welcomeList.add(WelcomeModel(
        "Become an Entrepreneur!",
        "Start your business with zero investment and eran upto ₹1 Lakh montly.",
        "https://picsum.photos/400"));
    welcomeList.add(WelcomeModel(
        "Indias top leading brands",
        "40+ Indian leading brands and counting.",
        "https://picsum.photos/400"));

    return welcomeList;
  }
  setActiveDot(index) {
    activeIndex(index) ;
  }
}

