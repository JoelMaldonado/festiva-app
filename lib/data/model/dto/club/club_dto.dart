import 'package:festiva/data/model/dto/club/club_schedule_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_dto.g.dart';

@JsonSerializable()
class ClubDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'emails')
  final List<String> emails;

  @JsonKey(name: 'phones')
  final List<String> phones;

  @JsonKey(name: 'logoUrl')
  final String? logoUrl;

  @JsonKey(name: 'covers')
  final List<String> covers;

  @JsonKey(name: 'address')
  final List<ClubAddressDto> address;

  @JsonKey(name: 'schedules')
  final List<ClubScheduleDto> schedules;

  @JsonKey(name: 'socialNetworks')
  final List<ClubSocialNetworkDto> socialNetworks;

  ClubDto({
    required this.id,
    required this.name,
    required this.description,
    required this.emails,
    required this.phones,
    required this.logoUrl,
    required this.covers,
    required this.address,
    required this.schedules,
    required this.socialNetworks,
  });

  factory ClubDto.fromJson(Map<String, dynamic> json) =>
      _$ClubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubDtoToJson(this);
}

@JsonSerializable()
class ClubAddressDto {
  final int? id;
  final String? address;
  final String? mapsUrl;
  final double? latitude;
  final double? longitude;

  ClubAddressDto({
    required this.id,
    required this.address,
    required this.mapsUrl,
    required this.latitude,
    required this.longitude,
  });

  factory ClubAddressDto.fromJson(Map<String, dynamic> json) =>
      _$ClubAddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubAddressDtoToJson(this);
}

@JsonSerializable()
class ClubSocialNetworkDto {
  final int? id;
  final String? url;
  final SocialNetwork? socialNetwork;

  ClubSocialNetworkDto({
    required this.id,
    required this.url,
    required this.socialNetwork,
  });

  factory ClubSocialNetworkDto.fromJson(Map<String, dynamic> json) =>
      _$ClubSocialNetworkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubSocialNetworkDtoToJson(this);
}

@JsonSerializable()
class SocialNetwork {
  final int id;
  final String name;
  final String logoUrl;

  SocialNetwork({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  factory SocialNetwork.fromJson(Map<String, dynamic> json) =>
      _$SocialNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$SocialNetworkToJson(this);
}
