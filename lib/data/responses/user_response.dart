import 'package:flutter_basic_base/data/models/user.dart';
import 'package:flutter_basic_base/data/responses/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse<User> {
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'user_gender')
  final String? userGender;
  @JsonKey(name: 'year_of_bird')
  final int? yearOfBird;

  UserResponse({
    this.userName,
    this.userGender,
    this.yearOfBird,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  User toModel() {
    return User(
      userAge: yearOfBird,
      userGender: userGender,
      userName: userName,
    );
  }
}
