import 'package:json_annotation/json_annotation.dart';

part 'update_item_count_request_dto.g.dart';

@JsonSerializable()
class UpdateItemCountRequestDto {
  @JsonKey(name: "count")
  final String? count;

  UpdateItemCountRequestDto({
    this.count,
  });

  factory UpdateItemCountRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateItemCountRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateItemCountRequestDtoToJson(this);
  }
}
