class LeadDetailResponse {
  bool? status;
  String? msg;
  String? imagesbaseurl;
  LeadDetail? data;

  LeadDetailResponse({this.status, this.msg, this.imagesbaseurl, this.data});

  LeadDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    imagesbaseurl = json['imagesbaseurl'];
    data = json['data'] != null ? new LeadDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['imagesbaseurl'] = this.imagesbaseurl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LeadDetail{
  int? id;
  dynamic partnerId;
  int? userId;
  int? jobId;
  String? name;
  String? mobile;
  dynamic reason;
  dynamic points;
  String? paymentId;
  String? leadsData;
  dynamic createdAt;
  dynamic updatedAt;
  int? status;
  String? image;
  dynamic imageStatus;
  int? deleteStatus;

  LeadDetail(
      {this.id,
        this.partnerId,
        this.userId,
        this.jobId,
        this.name,
        this.mobile,
        this.reason,
        this.points,
        this.paymentId,
        this.leadsData,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.image,
        this.imageStatus,
        this.deleteStatus});

  LeadDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partnerId = json['partner_id'];
    userId = json['user_id'];
    jobId = json['job_id'];
    name = json['name'];
    mobile = json['mobile'];
    reason = json['reason'];
    points = json['points'];
    paymentId = json['payment_id'];
    leadsData = json['leads_data'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    image = json['image'];
    imageStatus = json['image_status'];
    deleteStatus = json['delete_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partner_id'] = this.partnerId;
    data['user_id'] = this.userId;
    data['job_id'] = this.jobId;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['reason'] = this.reason;
    data['points'] = this.points;
    data['payment_id'] = this.paymentId;
    data['leads_data'] = this.leadsData;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['image'] = this.image;
    data['image_status'] = this.imageStatus;
    data['delete_status'] = this.deleteStatus;
    return data;
  }
}
