// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubLocationDto _$ClubLocationDtoFromJson(Map<String, dynamic> json) =>
    ClubLocationDto(
      idClub: (json['idClub'] as num?)?.toInt(),
      club: json['club'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      logoUrl: json['logoUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
    );

Map<String, dynamic> _$ClubLocationDtoToJson(ClubLocationDto instance) =>
    <String, dynamic>{
      'idClub': instance.idClub,
      'club': instance.club,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'logoUrl': instance.logoUrl,
      'coverUrl': instance.coverUrl,
    };
