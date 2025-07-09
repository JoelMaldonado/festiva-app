import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'club_summary_dto.g.dart';

@JsonSerializable()
class ClubSummaryDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'logoUrl')
  final String? logoUrl;

  @JsonKey(name: 'coverUrl')
  final String? coverUrl;

  ClubSummaryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.coverUrl,
  });

  factory ClubSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$ClubSummaryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubSummaryDtoToJson(this);

  ClubSummary toDomain() {
    return ClubSummary(
      id: id ?? 0,
      name: name ?? '',
      description: description ?? '',
      logoUrl: logoUrl,
      coverUrl: coverUrl,
    );
  }
}
