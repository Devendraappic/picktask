import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_list_response.g.dart';

@JsonSerializable()
class WithdrawalListResponse {
  bool? success;
  WithdrawalData? data;
  String? message;

  WithdrawalListResponse({this.success, this.data, this.message});

  factory WithdrawalListResponse.fromJson(Map<String, dynamic> json) => _$WithdrawalListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawalListResponseToJson(this);
}
@JsonSerializable()
class WithdrawalData {
  String? currentbalance;
  int? totalamount;
  List<ListData>? data;
  List<Creditedrequests>? creditedrequests;
  bool? status;

  WithdrawalData(
      {this.currentbalance,
        this.totalamount,
        this.data,
        this.creditedrequests,
        this.status});
  factory WithdrawalData.fromJson(Map<String, dynamic> json) => _$WithdrawalDataFromJson(json);
  Map<String, dynamic> toJson() => _$WithdrawalDataToJson(this);

}
@JsonSerializable()
class ListData {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  String? amount;
  int? status;
  @JsonKey(name: "transaction_id")
  String? transactionId;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  int? type;
  String? remarks;
  String? title;

  ListData(
      {this.id,
        this.userId,
        this.amount,
        this.status,
        this.transactionId,
        this.createdAt,
        this.updatedAt,
        this.type,
        this.remarks,
        this.title});
  factory ListData.fromJson(Map<String, dynamic> json) => _$ListDataFromJson(json);
  Map<String, dynamic> toJson() => _$ListDataToJson(this);

}
@JsonSerializable()
class Creditedrequests {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  String? amount;
  int? status;
  @JsonKey(name: "transaction_id")
  String? transactionId;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  int? type;
  String? remarks;
  String? title;

  Creditedrequests(
      {this.id,
        this.userId,
        this.amount,
        this.status,
        this.transactionId,
        this.createdAt,
        this.updatedAt,
        this.type,
        this.remarks,
        this.title});
  factory Creditedrequests.fromJson(Map<String, dynamic> json) => _$CreditedrequestsFromJson(json);
  Map<String, dynamic> toJson() => _$CreditedrequestsToJson(this);

}

