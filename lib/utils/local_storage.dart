import 'package:picktask/main.dart';

String? token = storage.read('token');
int? userId = storage.read('id');
String? name = storage.read('name');
String? role = storage.read('role');
String? email = storage.read('email');
String? mobileNo = storage.read('mobile');
String? status = storage.read('status');
String? firstName = storage.read('first_name');
dynamic earning = storage.read('earning');
int? kycStatus = storage.read('kyc_status');
String? referCode = storage.read("ref_code");
bool? isLogin = storage.read("is_login");
String? partnerId = storage.read("partner_id");
String? profilePic = storage.read("profile_pic");
