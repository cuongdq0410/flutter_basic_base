import 'package:json_annotation/json_annotation.dart';



part 'login_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
@JsonSerializable()
class LoginResponse{
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  LoginResponse({
    this.accessToken,
    this.refreshToken,
  }) : super();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
