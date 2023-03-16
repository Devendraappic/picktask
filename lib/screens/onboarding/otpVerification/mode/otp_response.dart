class OTPResponse {
  bool? status;
  String? msg;
  String? otp;

  OTPResponse({this.status, this.msg, this.otp});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['otp'] = this.otp;
    return data;
  }
}




