// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClubDto _$ClubDtoFromJson(Map<String, dynamic> json) => ClubDto(
      id: (json['id'] as num?)?.toInt(),
      nombre: json['nombre'] as String?,
      descrip: json['descrip'] as String?,
      urlLogo: json['url_logo'] as String?,
      urlPortada: json['url_portada'] as String?,
      direc: json['direc'] as String?,
      urlMaps: json['url_maps'] as String?,
      telf: json['telf'] as String?,
      socialReds: (json['discotecaRedes'] as List<dynamic>?)
          ?.map((e) => ClubSocialRedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClubDtoToJson(ClubDto instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'descrip': instance.descrip,
      'url_logo': instance.urlLogo,
      'url_portada': instance.urlPortada,
      'direc': instance.direc,
      'url_maps': instance.urlMaps,
      'telf': instance.telf,
      'discotecaRedes': instance.socialReds,
    };

ClubSocialRedDto _$ClubSocialRedDtoFromJson(Map<String, dynamic> json) =>
    ClubSocialRedDto(
      url: json['url'] as String?,
      red: json['red'] as String?,
      cod: json['cod'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$ClubSocialRedDtoToJson(ClubSocialRedDto instance) =>
    <String, dynamic>{
      'url': instance.url,
      'red': instance.red,
      'cod': instance.cod,
      'logo': instance.logo,
    };
