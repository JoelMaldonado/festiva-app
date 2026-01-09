import 'package:festiva/data/model/dto/event_category_dto.dart';
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

@JsonSerializable()
class EventDetailDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'clubId')
  final int? clubId;

  @JsonKey(name: 'clubName')
  final String? clubName;

  @JsonKey(name: 'clubLogoUrl')
  final String? clubLogoUrl;

  @JsonKey(name: 'ticketUrl')
  final String? ticketUrl;

  @JsonKey(name: 'categories')
  final List<EventCategoryDto>? categories;

  @JsonKey(name: 'schedules')
  final List<EventScheduleDto>? schedules;

  EventDetailDto({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.location,
    this.clubId,
    this.clubName,
    this.clubLogoUrl,
    this.ticketUrl,
    this.categories,
    this.schedules,
  });

  factory EventDetailDto.fromJson(Map<String, dynamic> json) =>
      _$EventDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventDetailDtoToJson(this);

  EventDetail toDomain() {
    return EventDetail(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      imageUrl: imageUrl ?? '',
      location: location ?? '',
      clubId: clubId ?? 0,
      clubName: clubName ?? '',
      clubLogoUrl: clubLogoUrl ?? '',
      ticketUrl: ticketUrl,
      categories:
          categories?.map((categoryDto) => categoryDto.toDomain()).toList() ??
              [],
      schedules:
          schedules?.map((scheduleDto) => scheduleDto.toDomain()).toList() ??
              [],
    );
  }
}

@JsonSerializable()
class EventScheduleDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'eventDate')
  final String? eventDate;

  @JsonKey(name: 'startTime')
  final String? startTime;

  EventScheduleDto({
    this.id,
    this.eventDate,
    this.startTime,
  });

  factory EventScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$EventScheduleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventScheduleDtoToJson(this);

  EventSchedule toDomain() {
    return EventSchedule(
      id: id ?? 0,
      eventDate: eventDate?.toDate(pattern: 'yyyy-MM-dd') ?? DateTime.now(),
      startTime: startTime?.toDate(pattern: 'HH:mm:ss') ?? DateTime.now(),
    );
  }
}
