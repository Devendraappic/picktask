import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  LoginData? data;
  @JsonKey(name: "message")
  String? message;

  LoginResponse({this.success, this.data, this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
@JsonSerializable()
class LoginData {
  @JsonKey(name: "Data")
  UserData? data;
  String? token;
  int? kycStatus;

  LoginData({this.data, this.token, this.kycStatus});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
@JsonSerializable()
class UserData {
  int? id;
  String? role;
  @JsonKey(name: "refer_by")
  dynamic referBy;
  @JsonKey(name: "ref_code")
  dynamic refCode;
  String? name;
  @JsonKey(name: "first_name")
  String? firstName;
  String? email;
  @JsonKey(name: "last_name")
  String? lastName;
  String? mobile;
  @JsonKey(name: "profile_pic")
  String? profilePic;
  dynamic ranking;
  int? earning;
  @JsonKey(name: "credit_score")
  dynamic creditScore;
  @JsonKey(name: "email_verified_at")
  dynamic emailVerifiedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "total_wallet_amount")
  String? totalWalletAmount;
  @JsonKey(name: "current_wallet_amout")
  String? currentWalletAmout;
  int? status;
  dynamic approve;
  @JsonKey(name: "deviceId")
  dynamic deviceId;
  @JsonKey(name: "kyc_status")
  int? kycStatus;
  @JsonKey(name: "partner_id")
  dynamic partnerId;
  @JsonKey(name: "trackingtime")
  dynamic trackingtime;
  @JsonKey(name: "earning_amount")
  dynamic earningAmount;
  dynamic otp;

  UserData(
      {this.id,
        this.role,
        this.referBy,
        this.refCode,
        this.name,
        this.firstName,
        this.email,
        this.lastName,
        this.mobile,
        this.profilePic,
        this.ranking,
        this.earning,
        this.creditScore,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.totalWalletAmount,
        this.currentWalletAmout,
        this.status,
        this.approve,
        this.deviceId,
        this.kycStatus,
        this.partnerId,
        this.trackingtime,
        this.earningAmount,
        this.otp});
  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}
