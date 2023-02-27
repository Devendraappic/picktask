class LeadsResponse {
  bool? status;
  String? msg;
  List<LeadData>? data;

  LeadsResponse({this.status, this.msg, this.data});

  LeadsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <LeadData>[];
      json['data'].forEach((v) {
        data!.add(new LeadData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeadData {
  int? id;
  dynamic partnerId;
  int? userId;
  int? jobId;
  String? name;
  String? mobile;
  String? reason;
  dynamic points;
  String? paymentId;
  String? leadsData;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? image;
  String? imageStatus;
  int? deleteStatus;

  LeadData(
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

  LeadData.fromJson(Map<String, dynamic> json) {
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
