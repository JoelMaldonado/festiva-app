// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubSummaryDto _$ClubSummaryDtoFromJson(Map<String, dynamic> json) =>
    ClubSummaryDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      logoUrl: json['logoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ClubSummaryDtoToJson(ClubSummaryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
