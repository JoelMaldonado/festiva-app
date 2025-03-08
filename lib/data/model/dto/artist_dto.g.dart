// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistDto _$ArtistDtoFromJson(Map<String, dynamic> json) => ArtistDto(
      id: (json['id'] as num?)?.toInt(),
      nombre: json['nombre'] as String?,
      tipo: json['tipo'] as String?,
      descrip: json['descrip'] as String?,
      biografia: json['biografia'] as String?,
      tags: json['tags'] as String?,
      urlFoto: json['url_foto'] as String?,
      urlFoto2: json['url_foto2'] as String?,
      socialReds: (json['redes'] as List<dynamic>?)
          ?.map((e) => ArtistSocialRedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistDtoToJson(ArtistDto instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'tipo': instance.tipo,
      'descrip': instance.descrip,
      'biografia': instance.biografia,
      'tags': instance.tags,
      'url_foto': instance.urlFoto,
      'url_foto2': instance.urlFoto2,
      'redes': instance.socialReds,
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
