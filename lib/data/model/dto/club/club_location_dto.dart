import 'package:festiva/domain/model/club/club_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_location_dto.g.dart';

@JsonSerializable()
class ClubLocationDto {
  @JsonKey(name: "idClub")
  final int? idClub;

  @JsonKey(name: "club")
  final String? club;

  @JsonKey(name: "logoUrl")
  final String? logoUrl;

  @JsonKey(name: "address")
  final String? address;

  @JsonKey(name: "latitude")
  final double? latitude;

  @JsonKey(name: "longitude")
  final double? longitude;

  @JsonKey(name: "mapsUrl")
  final String? mapsUrl;

  ClubLocationDto({
    required this.idClub,
    required this.club,
    required this.logoUrl,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.mapsUrl,
  });

  factory ClubLocationDto.fromJson(Map<String, dynamic> json) =>
      _$ClubLocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubLocationDtoToJson(this);

  ClubLocation toDomain() => ClubLocation(
        idClub: idClub ?? 0,
        club: club ?? "",
        logoUrl: logoUrl ?? "",
        address: address ?? "",
        latitude: latitude ?? 0.0,
        longitude: longitude ?? 0.0,
        mapsUrl: mapsUrl ?? "",
      );
}
