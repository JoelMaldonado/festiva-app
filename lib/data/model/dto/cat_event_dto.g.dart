// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatEventDto _$CatEventDtoFromJson(Map<String, dynamic> json) => CatEventDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['nombre'] as String?,
    );

Map<String, dynamic> _$CatEventDtoToJson(CatEventDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.name,
    };
