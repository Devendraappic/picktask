class WithdrawalListResponse {
  bool? success;
  WithdrawalData? data;
  String? message;

  WithdrawalListResponse({this.success, this.data, this.message});

  WithdrawalListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new WithdrawalData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class WithdrawalData {
  String? currentbalance;
  String? totalamount;
  List<WithdrawalItemData>? data;
  List<WithdrawalItemData>? creditedrequests;
  bool? status;

  WithdrawalData(
      {this.currentbalance,
        this.totalamount,
        this.data,
        this.creditedrequests,
        this.status});

  WithdrawalData.fromJson(Map<String, dynamic> json) {
    currentbalance = json['currentbalance'];
    totalamount = json['totalamount'];
    if (json['data'] != null) {
      data = <WithdrawalItemData>[];
      json['data'].forEach((v) {
        data!.add(new WithdrawalItemData.fromJson(v));
      });
    }
    if (json['creditedrequests'] != null) {
      creditedrequests = <WithdrawalItemData>[];
      json['creditedrequests'].forEach((v) {
        creditedrequests!.add(new WithdrawalItemData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentbalance'] = this.currentbalance;
    data['totalamount'] = this.totalamount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.creditedrequests != null) {
      data['creditedrequests'] =
          this.creditedrequests!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class WithdrawalItemData {
  int? id;
  int? userId;
  String? amount;
  int? status;
  String? transactionId;
  String? createdAt;
  String? updatedAt;
  int? type;

  WithdrawalItemData(
      {this.id,
        this.userId,
        this.amount,
        this.status,
        this.transactionId,
        this.createdAt,
        this.updatedAt,
        this.type});

  WithdrawalItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    status = json['status'];
    transactionId = json['transaction_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    return data;
  }
}
