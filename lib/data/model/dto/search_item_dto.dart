import 'package:festiva/domain/model/search_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_item_dto.g.dart';

@JsonSerializable()
class SearchItemDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'detail')
  final String? detail;

  @JsonKey(name: 'type')
  final String? type;

  SearchItemDto({
    this.id,
    this.detail,
    this.type,
  });

  factory SearchItemDto.fromJson(Map<String, dynamic> json) =>
      _$SearchItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemDtoToJson(this);

  SearchItem toDomain() {
    return SearchItem(
      id: id ?? 0,
      detail: detail ?? '',
      type: type ?? '',
    );
  }
}
