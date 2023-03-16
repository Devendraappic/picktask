
import 'package:json_annotation/json_annotation.dart';

part 'leads_list_response.g.dart';

@JsonSerializable()
class LeadsResponse {
  bool? status;
  String? msg;
  List<LeadData>? data;

  LeadsResponse({this.status, this.msg, this.data});


  factory LeadsResponse.fromJson(Map<String, dynamic> json) => _$LeadsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LeadsResponseToJson(this);
}
@JsonSerializable()
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
  @JsonKey(name: "leads_data")
  Map<String, dynamic>? leadsData;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? image;
  String? imageStatus;
  int? deleteStatus;
  String? remarks;
  String? tagline;

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
        this.deleteStatus,this.remarks, this.tagline
      });

  factory LeadData.fromJson(Map<String, dynamic> json) => _$LeadDataFromJson(json);
  Map<String, dynamic> toJson() => _$LeadDataToJson(this);
}





