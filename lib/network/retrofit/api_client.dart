import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:picktask/constants/app_constants.dart';
import 'package:picktask/screens/account/idCard/model/idcard_response.dart';
import 'package:picktask/screens/account/referAndEarn/model/refer_and_earn_response.dart';
import 'package:picktask/screens/approvedTasks/model/approved_task_response.dart';
import 'package:picktask/screens/createLead/model/create_lead_form_model.dart';
import 'package:picktask/screens/earning/model/withdrawal_list_response.dart';
import 'package:picktask/screens/home/model/home_response.dart';
import 'package:picktask/screens/leads/model/lead_detail_response.dart';
import 'package:picktask/screens/leads/model/leads_list_response.dart';
import 'package:picktask/screens/notifications/model/notification_list_response.dart';
import 'package:picktask/screens/onboarding/login/model/login_response.dart';
import 'package:picktask/network/retrofit/apis.dart';
import 'package:picktask/screens/onboarding/otpVerification/mode/otp_response.dart';
import 'package:picktask/screens/onboarding/register/model/register_response.dart';
import 'package:picktask/screens/task/model/apply_job_response.dart';
import 'package:picktask/screens/task/model/task_detail_response.dart';
import 'package:picktask/screens/task/model/task_list_response.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(
    baseUrl:
        AppConstants.baseUrl + AppConstants.apiPath + AppConstants.apiVersion)
abstract class ApiClient {
  factory ApiClient({String? baseUrl}) {
    var dio = Dio();
    Map<String, String> headers = <String, String>{
      //'Authorization':'Bearer ' +AppConstants.TOKEN,
      //'Authorization':'Basic '+base64Encode(utf8.encode('${AppConstants.API_USER_NAME}:${AppConstants.API_PASSWORD}')),
      'Accept': '*/*',
      'content-type': 'application/json',
    };
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        logPrint: (obj) {
          log(obj.toString());
        }));
    dio.options.headers = headers;
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST(Apis.login)
  Future<LoginResponse> userLogin(@Field('email') String email,
      @Field('password') String password);

  @POST(Apis.signup)
  Future<RegisterResponse> registerUser(@Field('full_name') String fullName,
      @Field('mobile') String mobile,
      @Field('email') String email,
      @Field('password') String password,
      @Field('referal_code') String referalCode,);


  @POST(Apis.sendOtp)
  Future<OTPResponse> sendOtp(@Field('mob_no') String mobile);

  @POST(Apis.otpVerify)
  Future<VerifyOTPResponse> verifyOtp(@Field('otp') String otp,
      @Field('mob_no') String mobile);


  @POST(Apis.identityCard)
  Future<IdCardResponse> getIdCardDetails(@Field('userid') int userId);

  @POST(Apis.myReferals)
  Future<MyReferalResponse> getMyReferals(@Field('userid') int userId);


  @POST(Apis.changePassword)
  Future<OTPResponse> changePassword(@Field('userid') int userId,
      @Field('oldpassword') String oldPassword,
      @Field('newpassword') String newPassword,);

  @POST(Apis.homePageApi)
  Future<HomePageResponse> getHomePageData(@Field('user_id') int userId);

  @POST(Apis.notificationList)
  Future<NotificationListResponse> getNotificationLIst(
      @Field('user_id') int userId);

  @POST(Apis.tasklist)
  Future<TaskListResponse> getTasks(@Field('category') String category);


  @POST(Apis.myLeadList)
  Future<LeadsResponse> getLeads(@Field('user_id') int userId,
      @Field('type') String status,);


  @POST(Apis.leadView)
  Future<LeadDetailResponse> getLeadDetail(@Field('leadid') int leadd);


  @POST(Apis.createLeadForm)
  Future<CreateLeadFormResponse> createLeadForm(@Field('jobid') int taskId);


  @POST(Apis.withdrawalList)
  Future<WithdrawalListResponse> withdrawalList(@Field('userId') int userId);


  @POST(Apis.approvedTaskList)
  Future<ApprovedTasksResponse> getApprovedTaskList(
      @Field('user_id') int userId);

  @POST(Apis.applyForJob)
  Future<ApplyJobResponse> applyForJob(
      @Field('jobId') int jobId,
      @Field('userId') int userId
      );

  @GET(Apis.viewtask + "/{taskId}")
  Future<TaskDetailResponse> getTaskDetails(@Path() int taskId);

}