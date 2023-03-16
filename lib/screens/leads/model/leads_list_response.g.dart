// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsResponse _$LeadsResponseFromJson(Map<String, dynamic> json) =>
    LeadsResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LeadData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadsResponseToJson(LeadsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

LeadData _$LeadDataFromJson(Map<String, dynamic> json) => LeadData(
      id: json['id'] as int?,
      partnerId: json['partnerId'],
      userId: json['userId'] as int?,
      jobId: json['jobId'] as int?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      reason: json['reason'] as String?,
      points: json['points'],
      paymentId: json['paymentId'] as String?,
      leadsData: json['leads_data'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      status: json['status'] as int?,
      image: json['image'] as String?,
      imageStatus: json['imageStatus'] as String?,
      deleteStatus: json['deleteStatus'] as int?,
      remarks: json['remarks'] as String?,
      tagline: json['tagline'] as String?,
    );

Map<String, dynamic> _$LeadDataToJson(LeadData instance) => <String, dynamic>{
      'id': instance.id,
      'partnerId': instance.partnerId,
      'userId': instance.userId,
      'jobId': instance.jobId,
      'name': instance.name,
      'mobile': instance.mobile,
      'reason': instance.reason,
      'points': instance.points,
      'paymentId': instance.paymentId,
      'leads_data': instance.leadsData,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'status': instance.status,
      'image': instance.image,
      'imageStatus': instance.imageStatus,
      'deleteStatus': instance.deleteStatus,
      'remarks': instance.remarks,
      'tagline': instance.tagline,
    };
