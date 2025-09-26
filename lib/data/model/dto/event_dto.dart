import 'package:festiva/domain/model/event.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'eventId')
  final int? eventId;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'eventDate')
  final String? eventDate;

  @JsonKey(name: 'startTime')
  final String? startTime;

  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'nameClub')
  final String? nameClub;

  @JsonKey(name: 'clubId')
  final int? clubId;

  @JsonKey(name: 'clubName')
  final String? clubName;

  @JsonKey(name: 'nameEventCategory')
  final String? nameCategory;

  @JsonKey(name: 'ticketUrl')
  final String? ticketUrl;

  @JsonKey(name: 'categories')
  final List<CategoryResponse>? categories;

  EventDto({
    required this.id,
    required this.eventId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.eventDate,
    required this.startTime,
    required this.location,
    required this.nameClub,
    required this.clubId,
    required this.clubName,
    required this.nameCategory,
    required this.ticketUrl,
    required this.categories,
  });

  factory EventDto.fromJson(Map<String, dynamic> json) =>
      _$EventDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  Event toDomain() {
    return Event(
      id: id ?? 0,
      eventId: eventId ?? 0,
      title: title ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      eventDate: eventDate?.toDate(pattern: 'yyyy-MM-dd'),
      startTime: startTime?.toDate(pattern: 'HH:mm:ss'),
      location: location,
      nameClub: nameClub,
      clubId: clubId,
      clubName: clubName,
      nameCategory: nameCategory,
      ticketUrl: ticketUrl,
      categories: categories ?? [],
    );
  }
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  CategoryResponse({
    required this.id,
    required this.title,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
