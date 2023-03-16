// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageResponse _$HomePageResponseFromJson(Map<String, dynamic> json) =>
    HomePageResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : HomePageData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomePageResponseToJson(HomePageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) => HomePageData(
      earning: json['earning'] as int?,
      name: json['name'] as String?,
      topbaner: (json['topbaner'] as List<dynamic>?)
          ?.map((e) => Topbaner.fromJson(e as Map<String, dynamic>))
          .toList(),
      webinar: (json['webinar'] as List<dynamic>?)
          ?.map((e) => Webinar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomePageDataToJson(HomePageData instance) =>
    <String, dynamic>{
      'earning': instance.earning,
      'name': instance.name,
      'topbaner': instance.topbaner,
      'webinar': instance.webinar,
    };

Topbaner _$TopbanerFromJson(Map<String, dynamic> json) => Topbaner(
      id: json['id'] as int?,
      bannerPic: json['banner_pic'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$TopbanerToJson(Topbaner instance) => <String, dynamic>{
      'id': instance.id,
      'banner_pic': instance.bannerPic,
      'link': instance.link,
    };

Webinar _$WebinarFromJson(Map<String, dynamic> json) => Webinar(
      id: json['id'] as int?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      image: json['image'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$WebinarToJson(Webinar instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'url': instance.url,
      'image': instance.image,
      'date': instance.date,
      'time': instance.time,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
