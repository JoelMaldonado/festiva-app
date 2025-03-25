import 'package:festiva_flutter/domain/model/club/club_summary.dart';
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

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  ClubSummaryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.createdAt,
    required this.updatedAt,
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
      createdAt: createdAt ?? '',
      updatedAt: updatedAt ?? '',
    );
  }
}
