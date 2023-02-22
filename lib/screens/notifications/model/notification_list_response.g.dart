// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationListResponse _$NotificationListResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationListResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotificationListResponseToJson(
        NotificationListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

NotificationItemData _$NotificationItemDataFromJson(
        Map<String, dynamic> json) =>
    NotificationItemData(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      heading: json['heading'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$NotificationItemDataToJson(
        NotificationItemData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image': instance.image,
      'description': instance.description,
      'heading': instance.heading,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
