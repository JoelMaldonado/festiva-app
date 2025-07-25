import 'package:json_annotation/json_annotation.dart';

part 'club_schedule_dto.g.dart';

@JsonSerializable()
class ClubScheduleDto {
  final int? id;
  final int? dayOfWeek;
  final String? name;
  final String? openingTime;
  final String? closingTime;

  ClubScheduleDto({
    required this.id,
    required this.dayOfWeek,
    required this.name,
    required this.openingTime,
    required this.closingTime,
  });

  factory ClubScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ClubScheduleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ClubScheduleDtoToJson(this);
}
