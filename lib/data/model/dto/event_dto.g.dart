// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      eventDatetime: json['eventDatetime'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'eventDatetime': instance.eventDatetime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
