import 'package:json_annotation/json_annotation.dart';

part 'notification_list_response.g.dart';

@JsonSerializable()
class NotificationListResponse {
  bool? status;
  String? msg;
  List<NotificationItemData>? data;

  NotificationListResponse({this.status, this.msg, this.data});
  factory NotificationListResponse.fromJson(Map<String, dynamic> json) => _$NotificationListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationListResponseToJson(this);

}
@JsonSerializable()
class NotificationItemData {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  String? image;
  String? description;
  String? heading;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  NotificationItemData(
      {this.id,
        this.userId,
        this.image,
        this.description,
        this.heading,
        this.createdAt,
        this.updatedAt});

  factory NotificationItemData.fromJson(Map<String, dynamic> json) => _$NotificationItemDataFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationItemDataToJson(this);
}
