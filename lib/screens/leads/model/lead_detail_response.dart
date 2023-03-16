import 'package:json_annotation/json_annotation.dart';

part 'lead_detail_response.g.dart';

@JsonSerializable()
class LeadDetailResponse {
  bool? status;
  String? msg;
  String? imagesbaseurl;
  LeadDetail? data;

  LeadDetailResponse({this.status, this.msg, this.imagesbaseurl, this.data});

  factory LeadDetailResponse.fromJson(Map<String, dynamic> json) => _$LeadDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LeadDetailResponseToJson(this);
}

@JsonSerializable()
class LeadDetail {
  int? id;
  @JsonKey(name: "partner_id")
  dynamic partnerId;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "job_id")
  int? jobId;
  String? name;
  String? mobile;
  String? reason;
  dynamic points;
  @JsonKey(name: "payment_id")
  String? paymentId;
  @JsonKey(name: "leads_data")
  Map<String, dynamic>? leadsData;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  int? status;
  String? image;
  @JsonKey(name: "image_status")
  String? imageStatus;
  @JsonKey(name: "delete_status")
  int? deleteStatus;
  dynamic remarks;
  dynamic city;
  dynamic email;

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
        this.deleteStatus,
        this.remarks,
        this.city,
        this.email});

  factory LeadDetail.fromJson(Map<String, dynamic> json) => _$LeadDetailFromJson(json);
  Map<String, dynamic> toJson() => _$LeadDetailToJson(this);
}

