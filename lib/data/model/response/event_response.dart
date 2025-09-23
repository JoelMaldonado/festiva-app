import 'package:festiva/data/model/dto/event_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class AllEventsPagedResponse {
  @JsonKey(name: 'items')
  final List<EventDto> events;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  AllEventsPagedResponse({
    required this.events,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory AllEventsPagedResponse.fromJson(Map<String, dynamic> json) =>
      _$AllEventsPagedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllEventsPagedResponseToJson(this);
}
