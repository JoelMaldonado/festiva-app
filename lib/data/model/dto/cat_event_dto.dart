import 'package:festiva_flutter/domain/model/cat_event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cat_event_dto.g.dart';

@JsonSerializable()
class CatEventDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'nombre')
  final String? name;

  CatEventDto({
    required this.id,
    required this.name,
  });

  factory CatEventDto.fromJson(Map<String, dynamic> json) =>
      _$CatEventDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatEventDtoToJson(this);

  CatEvent toDomain() {
    return CatEvent(
      id: id,
      name: name ?? '',
    );
  }
}
