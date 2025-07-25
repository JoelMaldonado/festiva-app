// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubDto _$ClubDtoFromJson(Map<String, dynamic> json) => ClubDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
      phones:
          (json['phones'] as List<dynamic>).map((e) => e as String).toList(),
      logoUrl: json['logoUrl'] as String?,
      covers:
          (json['covers'] as List<dynamic>).map((e) => e as String).toList(),
      address: (json['address'] as List<dynamic>)
          .map((e) => ClubAddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => ClubScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialNetworks: (json['socialNetworks'] as List<dynamic>)
          .map((e) => ClubSocialNetworkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClubDtoToJson(ClubDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'emails': instance.emails,
      'phones': instance.phones,
      'logoUrl': instance.logoUrl,
      'covers': instance.covers,
      'address': instance.address,
      'schedules': instance.schedules,
      'socialNetworks': instance.socialNetworks,
    };

ClubAddressDto _$ClubAddressDtoFromJson(Map<String, dynamic> json) =>
    ClubAddressDto(
      id: (json['id'] as num?)?.toInt(),
      address: json['address'] as String?,
      mapsUrl: json['mapsUrl'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ClubAddressDtoToJson(ClubAddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'mapsUrl': instance.mapsUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

ClubSocialNetworkDto _$ClubSocialNetworkDtoFromJson(
        Map<String, dynamic> json) =>
    ClubSocialNetworkDto(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      socialNetwork: json['socialNetwork'] == null
          ? null
          : SocialNetwork.fromJson(
              json['socialNetwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClubSocialNetworkDtoToJson(
        ClubSocialNetworkDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'socialNetwork': instance.socialNetwork,
    };

SocialNetwork _$SocialNetworkFromJson(Map<String, dynamic> json) =>
    SocialNetwork(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
    );

Map<String, dynamic> _$SocialNetworkToJson(SocialNetwork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
    };
