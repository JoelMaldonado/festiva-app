// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      id: (json['id'] as num?)?.toInt(),
      eventId: (json['eventId'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      eventDate: json['eventDate'] as String?,
      startTime: json['startTime'] as String?,
      idEventCategory: (json['idEventCategory'] as num?)?.toInt(),
      nameEventCategory: json['nameEventCategory'] as String?,
      location: json['location'] as String?,
      nameClub: json['nameClub'] as String?,
      clubId: (json['clubId'] as num?)?.toInt(),
      clubName: json['clubName'] as String?,
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'eventDate': instance.eventDate,
      'startTime': instance.startTime,
      'idEventCategory': instance.idEventCategory,
      'nameEventCategory': instance.nameEventCategory,
      'location': instance.location,
      'nameClub': instance.nameClub,
      'clubId': instance.clubId,
      'clubName': instance.clubName,
    };
