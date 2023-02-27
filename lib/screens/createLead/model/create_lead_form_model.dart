class CreateLeadFormResponse {
  bool? status;
  String? msg;
  List<LeadFormData>? data;

  CreateLeadFormResponse({this.status, this.msg, this.data});

  CreateLeadFormResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <LeadFormData>[];
      json['data'].forEach((v) {
        data!.add(new LeadFormData.fromJson(v));
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

class LeadFormData {
  int? id;
  int? jobId;
  String? field;
  String? value;
  dynamic image;
  dynamic imageStatus;
  String? createdAt;
  String? updatedAt;
  dynamic fieldTextController;
  dynamic fieldValue;

  LeadFormData(
      {this.id,
        this.jobId,
        this.field,
        this.value,
        this.image,
        this.imageStatus,
        this.createdAt,
        this.updatedAt,
        this.fieldTextController,
        this.fieldValue
      }
      );

  LeadFormData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    field = json['field'];
    value = json['value'];
    image = json['image'];
    imageStatus = json['image_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['field'] = this.field;
    data['value'] = this.value;
    data['image'] = this.image;
    data['image_status'] = this.imageStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
