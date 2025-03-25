// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      id: (json['id'] as num?)?.toInt(),
      nombre: json['name'] as String?,
      tipo: json['artistType'] as String?,
      descrip: json['description'] as String?,
      biografia: json['biography'] as String?,
      tags: json['tags'] as String?,
      urlFoto: json['profileUrl'] as String?,
      urlFoto2: json['profileCoverUrl'] as String?,
      socialReds: (json['socialNetworks'] as List<dynamic>?)
          ?.map((e) => ArtistSocialRedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.nombre,
      'artistType': instance.tipo,
      'description': instance.descrip,
      'biography': instance.biografia,
      'tags': instance.tags,
      'profileUrl': instance.urlFoto,
      'profileCoverUrl': instance.urlFoto2,
      'socialNetworks': instance.socialReds,
    };

ArtistSocialRedDto _$ArtistSocialRedDtoFromJson(Map<String, dynamic> json) =>
    ArtistSocialRedDto(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ArtistSocialRedDtoToJson(ArtistSocialRedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };
