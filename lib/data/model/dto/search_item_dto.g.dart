// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemDto _$SearchItemDtoFromJson(Map<String, dynamic> json) =>
    SearchItemDto(
      id: (json['id'] as num?)?.toInt(),
      detail: json['detail'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$SearchItemDtoToJson(SearchItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detail': instance.detail,
      'type': instance.type,
    };
