
import 'package:json_annotation/json_annotation.dart';

part 'idcard_response.g.dart';

@JsonSerializable()
class IdCardResponse {
  bool? status;
  String? msg;
  Data? data;

  IdCardResponse({this.status, this.msg, this.data});

  factory IdCardResponse.fromJson(Map<String, dynamic> json) => _$IdCardResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IdCardResponseToJson(this);
}
@JsonSerializable()
class Data {
  int? id;
  String? role;
  @JsonKey(name: "refer_by")
  String? referBy;
  @JsonKey(name: "ref_code")
  String? refCode;
  String? name;
  @JsonKey(name: "first_name")
  String? firstName;
  String? email;
  @JsonKey(name: "last_name")
  String? lastName;
  String? mobile;
  @JsonKey(name: "profile_pic")
  String? profilePic;
  String? ranking;
  dynamic earning;
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
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "remember_token")
  dynamic rememberToken;
  dynamic otp;

  Data(
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
        this.password,
        this.rememberToken,
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
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);




}
