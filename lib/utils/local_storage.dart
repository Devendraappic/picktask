import 'package:picktask/constants/key_constants.dart';
import 'package:picktask/main.dart';

int? userId = storage.read(KeyConstants.userIdKey);
String? name = storage.read(KeyConstants.nameKey);
String? email = storage.read(KeyConstants.emailKey);
String? mobileNo = storage.read(KeyConstants.mobileKey);
String? accountStatus = storage.read(KeyConstants.accountStatusKey);
dynamic earning = storage.read(KeyConstants.earningKey);
int? kycStatus = storage.read(KeyConstants.kycStatusKey);
String? referCode = storage.read(KeyConstants.refCodeKey);
bool? isLogin = storage.read(KeyConstants.isLoginKey);
dynamic totalWalletAmount = storage.read(KeyConstants.totalWalletAmountKey);
dynamic currentWalletAmount = storage.read(KeyConstants.currentWalletAmountKey);
String? partnerId = storage.read(KeyConstants.partnerIdKey);
String? profilePic = storage.read(KeyConstants.profilePicKey);
String? firebaseToken = storage.read(KeyConstants.firebaseTokenKey);



