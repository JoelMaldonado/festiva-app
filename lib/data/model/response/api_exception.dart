import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';

@JsonSerializable()
class ApiException implements Exception {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "error")
  final String error;

  @JsonKey(name: "statusCode")
  final int statusCode;

  ApiException({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ApiException.fromJson(Map<String, dynamic> json) =>
      _$ApiExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ApiExceptionToJson(this);
}
