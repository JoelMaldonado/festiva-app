import 'package:festiva_flutter/domain/model/club/club.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_dto.g.dart';

@JsonSerializable()
class ClubDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'nombre')
  final String? nombre;

  @JsonKey(name: 'descrip')
  final String? descrip;

  @JsonKey(name: 'url_logo')
  final String? urlLogo;

  @JsonKey(name: 'url_portada')
  final String? urlPortada;

  @JsonKey(name: 'direc')
  final String? direc;

  @JsonKey(name: 'url_maps')
  final String? urlMaps;

  @JsonKey(name: 'telf')
  final String? telf;

  @JsonKey(name: 'discotecaRedes')
  final List<ClubSocialRedDto>? socialReds;

  ClubDto({
    required this.id,
    required this.nombre,
    required this.descrip,
    required this.urlLogo,
    required this.urlPortada,
    required this.direc,
    required this.urlMaps,
    required this.telf,
    required this.socialReds,
  });

  factory ClubDto.fromJson(Map<String, dynamic> json) =>
      _$ClubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubDtoToJson(this);

  Club toDomain() {
    return Club(
      id: id ?? 0,
      nombre: nombre ?? '',
      descrip: descrip ?? '',
      urlLogo: urlLogo ?? '',
      urlPortada: urlPortada ?? '',
      direc: direc ?? '',
      urlMaps: urlMaps ?? '',
      telf: telf ?? '',
      socialReds: socialReds?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class ClubSocialRedDto {
  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'red')
  final String? red;

  @JsonKey(name: 'cod')
  final String? cod;

  @JsonKey(name: 'logo')
  final String? logo;

  ClubSocialRedDto({
    required this.url,
    required this.red,
    required this.cod,
    required this.logo,
  });

  factory ClubSocialRedDto.fromJson(Map<String, dynamic> json) =>
      _$ClubSocialRedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubSocialRedDtoToJson(this);

  ClubSocialRed toDomain() {
    return ClubSocialRed(
      url: url ?? '',
      red: red ?? '',
      cod: cod ?? '',
      logo: logo ?? '',
    );
  }
}
