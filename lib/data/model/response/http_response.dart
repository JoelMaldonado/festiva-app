import 'package:json_annotation/json_annotation.dart';

part 'http_response.g.dart';

@JsonSerializable()
class HttpResponse implements Exception {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "error")
  final String error;

  @JsonKey(name: "statusCcode")
  final int statusCode;

  HttpResponse({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory HttpResponse.fromJson(Map<String, dynamic> json) =>
      _$HttpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HttpResponseToJson(this);
}
