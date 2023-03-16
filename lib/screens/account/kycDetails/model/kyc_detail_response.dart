class KycDetailResponse {
  bool? status;
  String? msg;
  KYCData? data;

  KycDetailResponse({this.status, this.msg, this.data});

  KycDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new KYCData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class KYCData {
  int? id;
  String? penCard;
  String? penCardImage;
  dynamic aadharCard;
  dynamic aadharCardFront;
  dynamic aadharCardBack;
  String? bankName;
  String? accountHolderName;
  String? accountNumber;
  String? ifscCode;
  String? bankPhoto;
  int? bankpicEditby;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? nameOnpencard;
  String? gender;
  String? city;
  String? pincode;
  String? occupation;
  String? annualIncome;
  String? dob;
  int? kycStatus;

  KYCData(
      {this.id,
        this.penCard,
        this.penCardImage,
        this.aadharCard,
        this.aadharCardFront,
        this.aadharCardBack,
        this.bankName,
        this.accountHolderName,
        this.accountNumber,
        this.ifscCode,
        this.bankPhoto,
        this.bankpicEditby,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.nameOnpencard,
        this.gender,
        this.city,
        this.pincode,
        this.occupation,
        this.annualIncome,
        this.dob,
        this.kycStatus});

  KYCData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    penCard = json['pen_card'];
    penCardImage = json['pen_card_image'];
    aadharCard = json['aadhar_card'];
    aadharCardFront = json['aadhar_card_front'];
    aadharCardBack = json['aadhar_card_back'];
    bankName = json['bank_name'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankPhoto = json['bank_photo'];
    bankpicEditby = json['bankpic_editby'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nameOnpencard = json['name_onpencard'];
    gender = json['gender'];
    city = json['city'];
    pincode = json['pincode'];
    occupation = json['occupation'];
    annualIncome = json['annual_income'];
    dob = json['dob'];
    kycStatus = json['kycStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pen_card'] = this.penCard;
    data['pen_card_image'] = this.penCardImage;
    data['aadhar_card'] = this.aadharCard;
    data['aadhar_card_front'] = this.aadharCardFront;
    data['aadhar_card_back'] = this.aadharCardBack;
    data['bank_name'] = this.bankName;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['bank_photo'] = this.bankPhoto;
    data['bankpic_editby'] = this.bankpicEditby;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name_onpencard'] = this.nameOnpencard;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['pincode'] = this.pincode;
    data['occupation'] = this.occupation;
    data['annual_income'] = this.annualIncome;
    data['dob'] = this.dob;
    data['kycStatus'] = this.kycStatus;
    return data;
  }
}
