// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchUiHomeResponse _$FetchUiHomeResponseFromJson(Map<String, dynamic> json) =>
    FetchUiHomeResponse(
      clubs: (json['clubs'] as List<dynamic>)
          .map((e) => UiClub.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List<dynamic>)
          .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchUiHomeResponseToJson(
        FetchUiHomeResponse instance) =>
    <String, dynamic>{
      'clubs': instance.clubs,
      'events': instance.events,
      'artists': instance.artists,
    };

UiMeta _$UiMetaFromJson(Map<String, dynamic> json) => UiMeta(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
    );

Map<String, dynamic> _$UiMetaToJson(UiMeta instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
    };

UiClub _$UiClubFromJson(Map<String, dynamic> json) => UiClub(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      address: json['address'] as String?,
      schedules: (json['schedule'] as List<dynamic>)
          .map((e) => UiClubSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UiClubToJson(UiClub instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'coverUrl': instance.coverUrl,
      'address': instance.address,
      'schedule': instance.schedules,
    };

UiClubSchedule _$UiClubScheduleFromJson(Map<String, dynamic> json) =>
    UiClubSchedule(
      dayOfWeek: (json['dayOfWeek'] as num).toInt(),
      openingTime: json['openingTime'] as String,
      closingTime: json['closingTime'] as String,
    );

Map<String, dynamic> _$UiClubScheduleToJson(UiClubSchedule instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
    };

UiClubDetail _$UiClubDetailFromJson(Map<String, dynamic> json) => UiClubDetail(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String?,
      address: json['address'] as String?,
      covers:
          (json['covers'] as List<dynamic>).map((e) => e as String).toList(),
      googleRating: (json['googleRating'] as num?)?.toDouble(),
      googleUserRatingsTotal: (json['googleUserRatingsTotal'] as num?)?.toInt(),
      socialNetworks: (json['socialNetworks'] as List<dynamic>)
          .map((e) => UiClubSocialNetwork.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UiClubDetailToJson(UiClubDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logoUrl': instance.logoUrl,
      'address': instance.address,
      'covers': instance.covers,
      'googleRating': instance.googleRating,
      'googleUserRatingsTotal': instance.googleUserRatingsTotal,
      'socialNetworks': instance.socialNetworks,
    };

UiClubSocialNetwork _$UiClubSocialNetworkFromJson(Map<String, dynamic> json) =>
    UiClubSocialNetwork(
      url: json['url'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UiClubSocialNetworkToJson(
        UiClubSocialNetwork instance) =>
    <String, dynamic>{
      'url': instance.url,
      'code': instance.code,
      'name': instance.name,
    };

AppScreenFlagDto _$AppScreenFlagDtoFromJson(Map<String, dynamic> json) =>
    AppScreenFlagDto(
      id: (json['id'] as num).toInt(),
      screenKey: json['screenKey'] as String,
      isActive: (json['isActive'] as num).toInt(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AppScreenFlagDtoToJson(AppScreenFlagDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'screenKey': instance.screenKey,
      'isActive': instance.isActive,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
