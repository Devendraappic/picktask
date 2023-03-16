import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomePageResponse {
  bool? status;
  String? msg;
  HomePageData? data;

  HomePageResponse({this.status, this.msg, this.data});

  factory HomePageResponse.fromJson(Map<String, dynamic> json) => _$HomePageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomePageResponseToJson(this);

}
@JsonSerializable()
class HomePageData {
  int? earning;
  String? name;
  List<Topbaner>? topbaner;
  List<Webinar>? webinar;

  HomePageData({this.earning, this.name, this.topbaner, this.webinar});

  factory HomePageData.fromJson(Map<String, dynamic> json) => _$HomePageDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomePageDataToJson(this);
}
@JsonSerializable()
class Topbaner {
  int? id;
  @JsonKey(name: "banner_pic")
  String? bannerPic;
  String? link;

  Topbaner({this.id, this.bannerPic, this.link});
  factory Topbaner.fromJson(Map<String, dynamic> json) => _$TopbanerFromJson(json);
  Map<String, dynamic> toJson() => _$TopbanerToJson(this);
}
@JsonSerializable()
class Webinar {
  int? id;
  String? content;
  String? url;
  String? image;
  String? date;
  String? time;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  Webinar(
      {this.id,
        this.content,
        this.url,
        this.image,
        this.date,
        this.time,
        this.createdAt,
        this.updatedAt});
  factory Webinar.fromJson(Map<String, dynamic> json) => _$WebinarFromJson(json);
  Map<String, dynamic> toJson() => _$WebinarToJson(this);
}
