class TaskDetailResponse {
  bool? status;
  String? msg;
  TaskDetail? data;

  TaskDetailResponse({this.status, this.msg, this.data});

  TaskDetailResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new TaskDetail.fromJson(json['data']) : null;
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

class TaskDetail {
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
  String? trackingtime;
  String? earning;
  String? shareUrl;
  String? bannerimg;
  String? shareMessage;
  int? newStatus;

  TaskDetail(
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
        this.earning,
        this.shareUrl,
        this.bannerimg,
        this.shareMessage,
        this.newStatus});

  TaskDetail.fromJson(Map<String, dynamic> json) {
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
    shareUrl = json['share_url'];
    bannerimg = json['bannerimg'];
    shareMessage = json['share_message'];
    newStatus = json['new_status'];
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
    data['bannerimg'] = this.bannerimg;
    data['share_url'] = this.shareUrl;
    data['share_message'] = this.shareMessage;
    data['new_status'] = this.newStatus;
    return data;
  }
}
