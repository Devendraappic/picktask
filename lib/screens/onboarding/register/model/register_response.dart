class RegisterResponse {
  bool? success;
  Data? data;
  String? name;
  String? message;
  String? token;

  RegisterResponse(
      {this.success, this.data, this.name, this.message, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    name = json['name'];
    message = json['msg'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['name'] = this.name;
    data['msg'] = this.message;
    data['token'] = this.token;
    return data;
  }
}

class Data {
  UserData? userData;

  Data({this.userData});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? role;
  dynamic referBy;
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
  String? token;

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
        this.otp,
        this.token});

  UserData.fromJson(Map<String, dynamic> json) {
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
    token = json['token'];
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
    data['token'] = this.token;
    return data;
  }
}
