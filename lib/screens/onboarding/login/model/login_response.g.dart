// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      data: json['Data'] == null
          ? null
          : UserData.fromJson(json['Data'] as Map<String, dynamic>),
      token: json['token'] as String?,
      kycStatus: json['kycStatus'] as int?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'Data': instance.data,
      'token': instance.token,
      'kycStatus': instance.kycStatus,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      role: json['role'] as String?,
      referBy: json['refer_by'],
      refCode: json['ref_code'],
      name: json['name'] as String?,
      firstName: json['first_name'] as String?,
      email: json['email'] as String?,
      lastName: json['last_name'] as String?,
      mobile: json['mobile'] as String?,
      profilePic: json['profile_pic'] as String?,
      ranking: json['ranking'],
      earning: json['earning'] as int?,
      creditScore: json['credit_score'],
      emailVerifiedAt: json['email_verified_at'],
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

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
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
      'otp': instance.otp,
    };
