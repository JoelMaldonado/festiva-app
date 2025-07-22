import 'package:festiva/domain/model/event.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'eventDatetime')
  final String? eventDatetime;

  @JsonKey(name: 'nameEventCategory')
  final String? nameEventCategory;

  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'nameClub')
  final String? nameClub;

  EventDto({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.eventDatetime,
    required this.nameEventCategory,
    required this.location,
    required this.nameClub,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  Event toDomain() {
    return Event(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      eventDatetime: parseDatetime(eventDatetime),
      nameEventCategory: nameEventCategory,
      location: location,
      nameClub: nameClub,
    );
  }
}
