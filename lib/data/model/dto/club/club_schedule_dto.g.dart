// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubScheduleDto _$ClubScheduleDtoFromJson(Map<String, dynamic> json) =>
    ClubScheduleDto(
      id: (json['id'] as num?)?.toInt(),
      dayOfWeek: (json['dayOfWeek'] as num?)?.toInt(),
      name: json['name'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
    );

Map<String, dynamic> _$ClubScheduleDtoToJson(ClubScheduleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'name': instance.name,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
    };
