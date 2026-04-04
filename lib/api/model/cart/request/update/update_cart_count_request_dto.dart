import 'package:json_annotation/json_annotation.dart';

part 'update_cart_count_request_dto.g.dart';

@JsonSerializable()
class UpdateCartCountRequestDto {
  @JsonKey(name: "count")
  final String? count;

  UpdateCartCountRequestDto ({
    this.count,
  });

  factory UpdateCartCountRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateCartCountRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateCartCountRequestDtoToJson(this);
  }
}


