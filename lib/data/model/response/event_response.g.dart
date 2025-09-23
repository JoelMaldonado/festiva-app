// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEventsPagedResponse _$AllEventsPagedResponseFromJson(
        Map<String, dynamic> json) =>
    AllEventsPagedResponse(
      events: (json['items'] as List<dynamic>)
          .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$AllEventsPagedResponseToJson(
        AllEventsPagedResponse instance) =>
    <String, dynamic>{
      'items': instance.events,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
