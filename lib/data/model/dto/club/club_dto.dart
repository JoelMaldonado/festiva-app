import 'package:festiva_flutter/domain/model/club/club.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_dto.g.dart';

@JsonSerializable()
class ClubDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? descrip;

  @JsonKey(name: 'phone')
  final String? phone;

  @JsonKey(name: 'logoUrl')
  final String? logoUrl;

  @JsonKey(name: 'coverUrl')
  final String? coverUrl;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'mapsUrl')
  final String? mapsUrl;

  @JsonKey(name: 'socialReds')
  final List<ClubSocialRedDto>? socialReds;

  ClubDto({
    required this.id,
    required this.name,
    required this.descrip,
    required this.phone,
    required this.logoUrl,
    required this.coverUrl,
    required this.address,
    required this.mapsUrl,
    required this.socialReds,
  });

  factory ClubDto.fromJson(Map<String, dynamic> json) =>
      _$ClubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubDtoToJson(this);

  Club toDomain() {
    return Club(
      id: id ?? 0,
      name: name ?? '',
      descrip: descrip ?? '',
      phone: phone ?? '',
      logoUrl: logoUrl ?? '',
      coverUrl: coverUrl ?? '',
      address: address ?? '',
      mapsUrl: mapsUrl ?? '',
      socialReds: socialReds?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

@JsonSerializable()
class ClubSocialRedDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'logoUrl')
  final String? url;

  ClubSocialRedDto({
    required this.id,
    required this.name,
    required this.url,
  });

  factory ClubSocialRedDto.fromJson(Map<String, dynamic> json) =>
      _$ClubSocialRedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubSocialRedDtoToJson(this);

  ClubSocialRed toDomain() {
    return ClubSocialRed(
      id: id ?? 0,
      name: name ?? '',
      url: url ?? '',
    );
  }
}
