// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://growwingssolution.in/apis/public/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginResponse> userLogin(
    email,
    password,
    firebaseToken,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
      'token': firebaseToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterResponse> registerUser(
    fullName,
    mobile,
    email,
    password,
    referalCode,
    firebaseToken,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'full_name': fullName,
      'mobile': mobile,
      'email': email,
      'password': password,
      'referal_code': referalCode,
      'token': firebaseToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RegisterResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OTPResponse> sendOtp(
    mobile,
    firebaseToken,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'mob_num': mobile,
      'token': firebaseToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OTPResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'loginwithotp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OTPResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VerifyOTPResponse> verifyOtp(
    otp,
    mobile,
    firebaseToken,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'otp': otp,
      'mob_num': mobile,
      'token': firebaseToken,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<VerifyOTPResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'mobile_otpmatch',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyOTPResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IdCardResponse> getIdCardDetails(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'userid': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<IdCardResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'identitycard',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IdCardResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MyReferalResponse> getMyReferals(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'userid': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MyReferalResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'myreferals',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyReferalResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OTPResponse> changePassword(
    userId,
    oldPassword,
    newPassword,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'userid': userId,
      'oldpassword': oldPassword,
      'newpassword': newPassword,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OTPResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'changepassword',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OTPResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HomePageResponse> getHomePageData(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HomePageResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'dashbord',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HomePageResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NotificationListResponse> getNotificationLIst(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NotificationListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'notification',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NotificationListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskListResponse> getTasks(category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'category': category};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TaskListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'tasklist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LeadsResponse> getLeads(
    userId,
    status,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'user_id': userId,
      'type': status,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LeadsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'myleadlist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LeadsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LeadDetailResponse> getLeadDetail(leadd) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'leadid': leadd};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LeadDetailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'leadview',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LeadDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateLeadFormResponse> createLeadForm(taskId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'jobid': taskId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateLeadFormResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'create_leadform',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateLeadFormResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WithdrawalListResponse> withdrawalList(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'userId': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WithdrawalListResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'WithdrawalList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WithdrawalListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApprovedTasksResponse> getApprovedTaskList(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ApprovedTasksResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'approved_tasklist',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApprovedTasksResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApplyJobResponse> applyForJob(
    jobId,
    userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'jobId': jobId,
      'userId': userId,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApplyJobResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'applyForJob',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApplyJobResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApplyJobResponse> withdrawalRequest(
    userId,
    amount,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'userId': userId,
      'amount': amount,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApplyJobResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Withdrawalrequests',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ApplyJobResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<KycUpdateModel> updateKyc(
    userId,
    name_onpencard,
    gender,
    city,
    pincode,
    pan_number,
    ocupation,
    annual_income,
    dob,
    acc_holder_name,
    account_num,
    ifsc_code,
    bank_name,
    bank_proof,
    pencard_img,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'user_id',
      userId.toString(),
    ));
    _data.fields.add(MapEntry(
      'name_onpencard',
      name_onpencard,
    ));
    _data.fields.add(MapEntry(
      'gender',
      gender,
    ));
    _data.fields.add(MapEntry(
      'city',
      city,
    ));
    _data.fields.add(MapEntry(
      'pincode',
      pincode,
    ));
    _data.fields.add(MapEntry(
      'pan_number',
      pan_number,
    ));
    _data.fields.add(MapEntry(
      'ocupation',
      ocupation,
    ));
    _data.fields.add(MapEntry(
      'annual_income',
      annual_income,
    ));
    _data.fields.add(MapEntry(
      'dob',
      dob,
    ));
    _data.fields.add(MapEntry(
      'acc_holder_name',
      acc_holder_name,
    ));
    _data.fields.add(MapEntry(
      'account_num',
      account_num,
    ));
    _data.fields.add(MapEntry(
      'ifsc_code',
      ifsc_code,
    ));
    _data.fields.add(MapEntry(
      'bank_name',
      bank_name,
    ));
    if(bank_proof?.path.isNotEmpty==true){
      _data.files.add(MapEntry(
        'bank_proof',
        MultipartFile.fromFileSync(
          bank_proof!.path,
          filename: bank_proof.path.split(Platform.pathSeparator).last,
        ),
      ));
    }
    _data.files.add(MapEntry(
      'pencard_img',
      MultipartFile.fromFileSync(
        pencard_img.path,
        filename: pencard_img.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<KycUpdateModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'kycUpdate',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KycUpdateModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateProfilePicResponse> updateProfile(
    userId,
    image,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'user_id',
      userId.toString(),
    ));
    _data.files.add(MapEntry(
      'image',
      MultipartFile.fromFileSync(
        image.path,
        filename: image.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateProfilePicResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'update_profile',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateProfilePicResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MyAccountResponse> myAccountRequest(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'userid': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MyAccountResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'myaccount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MyAccountResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LeadSubmitResponse> submitLeadRequest(
    userId,
    jobId,
    data,
    images,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry(
      'user_id',
      userId.toString(),
    ));
    _data.fields.add(MapEntry(
      'job_id',
      jobId.toString(),
    ));
    _data.fields.add(MapEntry(
      'data',
      jsonEncode(data),
    ));
    _data.files.addAll(images.map((i) => MapEntry(
        'images[]',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LeadSubmitResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              'lead_submit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LeadSubmitResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TaskDetailResponse> getTaskDetails(
    taskId,
    userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TaskDetailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'viewtask/${taskId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<KycDetailResponse> getKYCDetails(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'user_id': userId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<KycDetailResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'user_kyc_data',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KycDetailResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
