// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      id: (json['id'] as num?)?.toInt(),
      titulo: json['titulo'] as String?,
      descrip: json['descrip'] as String?,
      urlFoto: json['url_foto'] as String?,
      fecha: json['fecha'] as String?,
      hora: json['hora'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descrip': instance.descrip,
      'url_foto': instance.urlFoto,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'createdAt': instance.createdAt,
    };
