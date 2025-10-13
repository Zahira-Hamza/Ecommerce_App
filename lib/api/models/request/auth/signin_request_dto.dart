import 'package:json_annotation/json_annotation.dart';

part 'signin_request_dto.g.dart';

@JsonSerializable()
class SigninRequestDto {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "password")
  final String password;

  SigninRequestDto({required this.email, required this.password});

  factory SigninRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestDtoToJson(this);
}
