import 'package:json_annotation/json_annotation.dart';

import 'user_dto.dart';

part 'auth_response_dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "user")
  final UserDto user;

  @JsonKey(name: "token")
  final String token;

  AuthResponseDto({
    required this.message,
    required this.user,
    required this.token,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}
