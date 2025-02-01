// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) => ApiException(
      message: json['message'] as String,
      error: json['error'] as String,
      statusCode: (json['statusCcode'] as num).toInt(),
    );

Map<String, dynamic> _$ApiExceptionToJson(ApiException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'statusCcode': instance.statusCode,
    };
