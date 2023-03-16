// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadDetailResponse _$LeadDetailResponseFromJson(Map<String, dynamic> json) =>
    LeadDetailResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      imagesbaseurl: json['imagesbaseurl'] as String?,
      data: json['data'] == null
          ? null
          : LeadDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeadDetailResponseToJson(LeadDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'imagesbaseurl': instance.imagesbaseurl,
      'data': instance.data,
    };

LeadDetail _$LeadDetailFromJson(Map<String, dynamic> json) => LeadDetail(
      id: json['id'] as int?,
      partnerId: json['partner_id'],
      userId: json['user_id'] as int?,
      jobId: json['job_id'] as int?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      reason: json['reason'] as String?,
      points: json['points'],
      paymentId: json['payment_id'] as String?,
      leadsData: json['leads_data'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      status: json['status'] as int?,
      image: json['image'] as String?,
      imageStatus: json['image_status'] as String?,
      deleteStatus: json['delete_status'] as int?,
      remarks: json['remarks'],
      city: json['city'],
      email: json['email'],
    );

Map<String, dynamic> _$LeadDetailToJson(LeadDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partner_id': instance.partnerId,
      'user_id': instance.userId,
      'job_id': instance.jobId,
      'name': instance.name,
      'mobile': instance.mobile,
      'reason': instance.reason,
      'points': instance.points,
      'payment_id': instance.paymentId,
      'leads_data': instance.leadsData,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
      'image': instance.image,
      'image_status': instance.imageStatus,
      'delete_status': instance.deleteStatus,
      'remarks': instance.remarks,
      'city': instance.city,
      'email': instance.email,
    };
