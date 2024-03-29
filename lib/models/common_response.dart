import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';


@JsonSerializable(genericArgumentFactories: true)
class CommonResponse<T> {
  @JsonKey(name:"code")
  final int code;
  @JsonKey(name:"status")
  final bool status;
  @JsonKey(name:"message",defaultValue: "")
  final String message;
  @JsonKey(name:"data")
  final T? data;

  CommonResponse({
    this.message = "",
    this.data,
    this.code = 0,
    this.status = false
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$CommonResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$CommonResponseToJson(this, toJsonT);
}
