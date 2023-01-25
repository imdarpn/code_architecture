import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class LoginResponse{
  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"token")
  String? token;

  LoginResponse({ this.id, this.name, this.email, this.token });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}