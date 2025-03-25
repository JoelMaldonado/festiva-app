// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventCategoryDto _$EventCategoryDtoFromJson(Map<String, dynamic> json) =>
    EventCategoryDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$EventCategoryDtoToJson(EventCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
