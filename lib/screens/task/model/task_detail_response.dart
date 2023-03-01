class TaskDetailResponse {
  bool? status;
  String? msg;
  TaskDetails? data;

  TaskDetailResponse({this.status, this.msg, this.data});

  TaskDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new TaskDetails.fromJson(json['data']) : null;
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

class TaskDetails {
  int? id;
  dynamic partnerId;
  String? title;
  String? photo;
  String? description;
  String? jobType;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? isImage;
  int? paymentId;
  int? adminStatus;
  dynamic trackingtime;
  String? earning;

  TaskDetails(
      {this.id,
        this.partnerId,
        this.title,
        this.photo,
        this.description,
        this.jobType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.isImage,
        this.paymentId,
        this.adminStatus,
        this.trackingtime,
        this.earning});

  TaskDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partnerId = json['partner_id'];
    title = json['title'];
    photo = json['photo'];
    description = json['description'];
    jobType = json['job_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isImage = json['isImage'];
    paymentId = json['payment_id'];
    adminStatus = json['admin_status'];
    trackingtime = json['trackingtime'];
    earning = json['earning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partner_id'] = this.partnerId;
    data['title'] = this.title;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['job_type'] = this.jobType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isImage'] = this.isImage;
    data['payment_id'] = this.paymentId;
    data['admin_status'] = this.adminStatus;
    data['trackingtime'] = this.trackingtime;
    data['earning'] = this.earning;
    return data;
  }
}
