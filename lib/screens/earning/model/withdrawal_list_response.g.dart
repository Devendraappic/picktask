// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalListResponse _$WithdrawalListResponseFromJson(
        Map<String, dynamic> json) =>
    WithdrawalListResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : WithdrawalData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$WithdrawalListResponseToJson(
        WithdrawalListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

WithdrawalData _$WithdrawalDataFromJson(Map<String, dynamic> json) =>
    WithdrawalData(
      currentbalance: json['currentbalance'] as String?,
      totalamount: json['totalamount'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ListData.fromJson(e as Map<String, dynamic>))
          .toList(),
      creditedrequests: (json['creditedrequests'] as List<dynamic>?)
          ?.map((e) => Creditedrequests.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$WithdrawalDataToJson(WithdrawalData instance) =>
    <String, dynamic>{
      'currentbalance': instance.currentbalance,
      'totalamount': instance.totalamount,
      'data': instance.data,
      'creditedrequests': instance.creditedrequests,
      'status': instance.status,
    };

ListData _$ListDataFromJson(Map<String, dynamic> json) => ListData(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      amount: json['amount'] as String?,
      status: json['status'] as int?,
      transactionId: json['transaction_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      type: json['type'] as int?,
      remarks: json['remarks'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ListDataToJson(ListData instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'status': instance.status,
      'transaction_id': instance.transactionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'remarks': instance.remarks,
      'title': instance.title,
    };

Creditedrequests _$CreditedrequestsFromJson(Map<String, dynamic> json) =>
    Creditedrequests(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      amount: json['amount'] as String?,
      status: json['status'] as int?,
      transactionId: json['transaction_id'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      type: json['type'] as int?,
      remarks: json['remarks'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CreditedrequestsToJson(Creditedrequests instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'amount': instance.amount,
      'status': instance.status,
      'transaction_id': instance.transactionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type': instance.type,
      'remarks': instance.remarks,
      'title': instance.title,
    };
