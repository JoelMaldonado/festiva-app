import 'package:festiva/domain/model/event_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_category_dto.g.dart';

@JsonSerializable()
class EventCategoryDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  EventCategoryDto({
    required this.id,
    required this.title,
  });

  factory EventCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$EventCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventCategoryDtoToJson(this);

  EventCategory toDomain() {
    return EventCategory(
      id: id,
      title: title,
    );
  }
}
