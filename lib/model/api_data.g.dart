// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiData _$ApiDataFromJson(Map<String, dynamic> json) {
  return ApiData()
    ..date = json['date'] as String
    ..explanation = json['explanation'] as String
    ..hdurl = json['hdurl'] as String
    ..mediaType = json['media_type'] as String
    ..serviceVersion = json['service_version'] as String
    ..title = json['title'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$ApiDataToJson(ApiData instance) => <String, dynamic>{
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'service_version': instance.serviceVersion,
      'title': instance.title,
      'url': instance.url,
    };
