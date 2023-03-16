class MyAccountResponse {
  bool? status;
  String? msg;
  int? kycStatus;
  Data? data;
  String? profile_pic;
  String? profilepic;

  MyAccountResponse(
      {this.status, this.msg, this.kycStatus, this.data,this.profile_pic, this.profilepic});

  MyAccountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    kycStatus = json['kycStatus'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    profile_pic = json['profile_pic'];
    profilepic = json['profilepic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['kycStatus'] = this.kycStatus;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['profile_pic'] = this.profile_pic;
    data['profilepic'] = this.profilepic;
    return data;
  }
}

class Data {
  String? name;
  dynamic partnerId;
  String? refCode;

  Data({this.name, this.partnerId, this.refCode});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    partnerId = json['partner_id'];
    refCode = json['ref_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['partner_id'] = this.partnerId;
    data['ref_code'] = this.refCode;
    return data;
  }
}
