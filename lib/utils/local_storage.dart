import 'package:get_storage/get_storage.dart';

var storage = GetStorage();

String token = storage.read('token');
String userId = storage.read('id');
String name = storage.read('name');
String role = storage.read('role');
String email = storage.read('email');
String mobileNo = storage.read('mobile');
String status = storage.read('status');
String firstName = storage.read('first_name');
String earning = storage.read('earning');
String kycStatus = storage.read('kyc_status');
String refferCode = storage.read("ref_code");
