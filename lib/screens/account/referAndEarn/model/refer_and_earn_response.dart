class MyReferalResponse {
  bool? status;
  String? msg;
  String? selfrefid;
  List<ReferUserData>? data;

  MyReferalResponse({this.status, this.msg, this.selfrefid, this.data});

  MyReferalResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    selfrefid = json['Selfrefid'];
    if (json['data'] != null) {
      data = <ReferUserData>[];
      json['data'].forEach((v) {
        data!.add(new ReferUserData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['Selfrefid'] = this.selfrefid;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReferUserData {
  int? id;
  String? role;
  String? referBy;
  String? refCode;
  String? name;
  dynamic firstName;
  String? email;
  dynamic lastName;
  String? mobile;
  String? profilePic;
  dynamic ranking;
  int? earning;
  dynamic creditScore;
  dynamic emailVerifiedAt;
  String? password;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  String? totalWalletAmount;
  String? currentWalletAmout;
  int? status;
  dynamic approve;
  dynamic deviceId;
  int? kycStatus;
  dynamic partnerId;
  dynamic trackingtime;
  dynamic earningAmount;
  dynamic otp;

  ReferUserData(
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

  ReferUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    referBy = json['refer_by'];
    refCode = json['ref_code'];
    name = json['name'];
    firstName = json['first_name'];
    email = json['email'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    profilePic = json['profile_pic'];
    ranking = json['ranking'];
    earning = json['earning'];
    creditScore = json['credit_score'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalWalletAmount = json['total_wallet_amount'];
    currentWalletAmout = json['current_wallet_amout'];
    status = json['status'];
    approve = json['approve'];
    deviceId = json['deviceId'];
    kycStatus = json['kyc_status'];
    partnerId = json['partner_id'];
    trackingtime = json['trackingtime'];
    earningAmount = json['earning_amount'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['refer_by'] = this.referBy;
    data['ref_code'] = this.refCode;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['profile_pic'] = this.profilePic;
    data['ranking'] = this.ranking;
    data['earning'] = this.earning;
    data['credit_score'] = this.creditScore;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['remember_token'] = this.rememberToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_wallet_amount'] = this.totalWalletAmount;
    data['current_wallet_amout'] = this.currentWalletAmout;
    data['status'] = this.status;
    data['approve'] = this.approve;
    data['deviceId'] = this.deviceId;
    data['kyc_status'] = this.kycStatus;
    data['partner_id'] = this.partnerId;
    data['trackingtime'] = this.trackingtime;
    data['earning_amount'] = this.earningAmount;
    data['otp'] = this.otp;
    return data;
  }
}
