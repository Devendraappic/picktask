// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idcard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdCardResponse _$IdCardResponseFromJson(Map<String, dynamic> json) =>
    IdCardResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IdCardResponseToJson(IdCardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      role: json['role'] as String?,
      referBy: json['refer_by'] as String?,
      refCode: json['ref_code'] as String?,
      name: json['name'] as String?,
      firstName: json['first_name'] as String?,
      email: json['email'] as String?,
      lastName: json['last_name'] as String?,
      mobile: json['mobile'] as String?,
      profilePic: json['profile_pic'] as String?,
      ranking: json['ranking'] as String?,
      earning: json['earning'],
      creditScore: json['credit_score'],
      emailVerifiedAt: json['email_verified_at'],
      password: json['password'] as String?,
      rememberToken: json['remember_token'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      totalWalletAmount: json['total_wallet_amount'] as String?,
      currentWalletAmout: json['current_wallet_amout'] as String?,
      status: json['status'] as int?,
      approve: json['approve'],
      deviceId: json['deviceId'],
      kycStatus: json['kyc_status'] as int?,
      partnerId: json['partner_id'],
      trackingtime: json['trackingtime'],
      earningAmount: json['earning_amount'],
      otp: json['otp'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'refer_by': instance.referBy,
      'ref_code': instance.refCode,
      'name': instance.name,
      'first_name': instance.firstName,
      'email': instance.email,
      'last_name': instance.lastName,
      'mobile': instance.mobile,
      'profile_pic': instance.profilePic,
      'ranking': instance.ranking,
      'earning': instance.earning,
      'credit_score': instance.creditScore,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'total_wallet_amount': instance.totalWalletAmount,
      'current_wallet_amout': instance.currentWalletAmout,
      'status': instance.status,
      'approve': instance.approve,
      'deviceId': instance.deviceId,
      'kyc_status': instance.kycStatus,
      'partner_id': instance.partnerId,
      'trackingtime': instance.trackingtime,
      'earning_amount': instance.earningAmount,
      'password': instance.password,
      'remember_token': instance.rememberToken,
      'otp': instance.otp,
    };
