// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubDto _$ClubDtoFromJson(Map<String, dynamic> json) => ClubDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      descrip: json['description'] as String?,
      phone: json['phone'] as String?,
      logoUrl: json['logoUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      address: json['address'] as String?,
      mapsUrl: json['mapsUrl'] as String?,
      socialReds: (json['socialReds'] as List<dynamic>?)
          ?.map((e) => ClubSocialRedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClubDtoToJson(ClubDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.descrip,
      'phone': instance.phone,
      'logoUrl': instance.logoUrl,
      'coverUrl': instance.coverUrl,
      'address': instance.address,
      'mapsUrl': instance.mapsUrl,
      'socialReds': instance.socialReds,
    };

ClubSocialRedDto _$ClubSocialRedDtoFromJson(Map<String, dynamic> json) =>
    ClubSocialRedDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      url: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$ClubSocialRedDtoToJson(ClubSocialRedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.url,
    };
