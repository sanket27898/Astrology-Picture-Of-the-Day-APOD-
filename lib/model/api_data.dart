import 'package:json_annotation/json_annotation.dart';

part 'api_data.g.dart';

@JsonSerializable()
class ApiData {
  @JsonKey(name: "date")
  String date;
  @JsonKey(name: "explanation")
  String explanation;
  @JsonKey(name: "hdurl")
  String hdurl;
  @JsonKey(name: "media_type")
  String mediaType;
  @JsonKey(name: "service_version")
  String serviceVersion;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "url")
  String url;

  ApiData();
  factory ApiData.fromJson(Map<String, dynamic> json) =>
      _$ApiDataFromJson(json);
  Map<String, dynamic> toJson() => _$ApiDataToJson(this);
}
