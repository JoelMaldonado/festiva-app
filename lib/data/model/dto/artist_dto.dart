import 'package:festiva/domain/model/artist.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_dto.g.dart';

@JsonSerializable()
class ArtistDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? nombre;

  @JsonKey(name: 'artistType')
  final String? tipo;

  @JsonKey(name: 'description')
  final String? descrip;

  @JsonKey(name: 'biography')
  final String? biografia;

  @JsonKey(name: 'tags')
  final String? tags;

  @JsonKey(name: 'profileUrl')
  final String? urlFoto;

  @JsonKey(name: 'profileCoverUrl')
  final String? urlFoto2;

  @JsonKey(name: 'socialNetworks')
  final List<ArtistSocialRedDto>? socialReds;

  ArtistDto({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.descrip,
    required this.biografia,
    required this.tags,
    required this.urlFoto,
    required this.urlFoto2,
    required this.socialReds,
  });

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDtoToJson(this);

  Artist toDomain() {
    return Artist(
      id: id ?? 0,
      nombre: nombre ?? '',
      tipo: tipo ?? '',
      descrip: descrip ?? '',
      biografia: biografia ?? '',
      tags: tags ?? '',
      urlFoto: urlFoto,
      urlFoto2: urlFoto2,
      socialReds: socialReds?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class ArtistSocialRedDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'name')
  final String? name;

  ArtistSocialRedDto({
    required this.id,
    required this.url,
    required this.code,
    required this.name,
  });

  factory ArtistSocialRedDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistSocialRedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistSocialRedDtoToJson(this);

  ArtistSocialRed toDomain() {
    return ArtistSocialRed(
      id: id ?? 0,
      url: url ?? '',
      code: code ?? '',
      name: name ?? '',
    );
  }
}
