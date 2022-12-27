import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:picktask/model/home/home_model.dart';
import 'package:picktask/utils/endpoint_url.dart';
import 'package:picktask/utils/local_storage.dart';

class HomeController extends GetxController {
  RxList<BannerModel> bannerList = RxList();

  RxBool isLoading = false.obs;

  Future<dynamic> homeApi() async {
    isLoading.value = true;
    var res = await http.post(Uri.parse(home_url), body: {
      "user_id": "198",
    });

    var webinarArray;
    var bannerArray;

    if (res.statusCode == 200) {
      isLoading.value = true;
      var data = jsonDecode(res.body.toString());
      print("data: " + data.toString());

      if (data['status'] == true) {
        bannerArray = data["data"]["topbaner"];

        print("banner: $bannerArray");

        for (var i = 0; i < bannerArray.length; i++) {
          BannerModel bannerModel = BannerModel();
          bannerModel.id = bannerArray[i]["id"].toString();
          bannerModel.banner_pic = bannerArray[i]["banner_pic"].toString();
          bannerModel.link = bannerArray[i]["link"].toString();

          bannerList.add(bannerModel);
          print(bannerList.length);
        }

        isLoading.value = false;
      } else {
        isLoading.value = false;
        // Get.snackbar(data['msg'], "", colorText: kWhiteColor);
      }
    } else {
      isLoading.value = false;
    }
  }
}
