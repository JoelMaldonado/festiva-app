// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ui_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchUiClubsResponse _$FetchUiClubsResponseFromJson(
        Map<String, dynamic> json) =>
    FetchUiClubsResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => UiClub.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: UiMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FetchUiClubsResponseToJson(
        FetchUiClubsResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
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
      type: json['type'] as String,
    );

Map<String, dynamic> _$UiClubToJson(UiClub instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'coverUrl': instance.coverUrl,
      'type': instance.type,
    };

UiClubDetail _$UiClubDetailFromJson(Map<String, dynamic> json) => UiClubDetail(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      logoUrl: json['logoUrl'] as String?,
      covers:
          (json['covers'] as List<dynamic>).map((e) => e as String).toList(),
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
      'covers': instance.covers,
      'socialNetworks': instance.socialNetworks,
    };

UiClubSocialNetwork _$UiClubSocialNetworkFromJson(Map<String, dynamic> json) =>
    UiClubSocialNetwork(
      url: json['url'] as String,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String,
    );

Map<String, dynamic> _$UiClubSocialNetworkToJson(
        UiClubSocialNetwork instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
    };
