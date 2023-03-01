class ApprovedTasksResponse {
  bool? status;
  List<ApprovedTaskData>? data;

  ApprovedTasksResponse({this.status, this.data});

  ApprovedTasksResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ApprovedTaskData>[];
      json['data'].forEach((v) {
        data!.add(new ApprovedTaskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApprovedTaskData {
  String? jobname;
  String? jobType;
  int? jobId;
  String? photo;
  int? status;

  ApprovedTaskData({this.jobname, this.jobType, this.jobId, this.photo, this.status});

  ApprovedTaskData.fromJson(Map<String, dynamic> json) {
    jobname = json['jobname'];
    jobType = json['job_type'];
    jobId = json['job_id'];
    photo = json['photo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobname'] = this.jobname;
    data['job_type'] = this.jobType;
    data['job_id'] = this.jobId;
    data['photo'] = this.photo;
    data['status'] = this.status;
    return data;
  }
}
