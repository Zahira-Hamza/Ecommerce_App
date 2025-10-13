import 'package:json_annotation/json_annotation.dart';

import '../../common/brand_dto.dart';
import '../../common/metadata_dto.dart';

part 'brands_response_dto.g.dart'; // Make sure this part directive is correct

@JsonSerializable()
class BrandsResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "data")
  final List<BrandDto>? data;

  BrandsResponseDto({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$BrandsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BrandsResponseDtoToJson(this);
  }
}
