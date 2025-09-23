import 'package:festiva/data/model/dto/artist_dto.dart';
import 'package:festiva/data/model/dto/club/club_dto.dart';
import 'package:festiva/data/model/dto/club/club_summary_dto.dart';
import 'package:festiva/data/model/dto/event_dto.dart';
import 'package:festiva/domain/model/app_screen_flag.dart';
import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ui_response.g.dart';

@JsonSerializable()
class FetchUiClubsResponse {
  @JsonKey(name: 'items')
  final List<UiClub> items;

  @JsonKey(name: 'meta')
  final UiMeta meta;

  FetchUiClubsResponse({
    required this.items,
    required this.meta,
  });

  factory FetchUiClubsResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchUiClubsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchUiClubsResponseToJson(this);
}

@JsonSerializable()
class FetchUiHomeResponse {
  @JsonKey(name: 'clubs')
  final List<UiClub> clubs;

  @JsonKey(name: 'events')
  final List<EventDto> events;

  @JsonKey(name: 'artists')
  final List<ArtistDto> artists;

  FetchUiHomeResponse({
    required this.clubs,
    required this.events,
    required this.artists,
  });

  factory FetchUiHomeResponse.fromJson(Map<String, dynamic> json) =>
      _$FetchUiHomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FetchUiHomeResponseToJson(this);
}

@JsonSerializable()
class UiMeta {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'limit')
  final int limit;

  @JsonKey(name: 'total')
  final int total;

  @JsonKey(name: 'totalPages')
  final int totalPages;

  @JsonKey(name: 'hasNextPage')
  final bool hasNextPage;

  @JsonKey(name: 'hasPreviousPage')
  final bool hasPreviousPage;

  UiMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory UiMeta.fromJson(Map<String, dynamic> json) => _$UiMetaFromJson(json);

  Map<String, dynamic> toJson() => _$UiMetaToJson(this);
}

@JsonSerializable()
class UiClub {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'logoUrl')
  final String? logoUrl;

  @JsonKey(name: 'coverUrl')
  final String? coverUrl;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'isOpen')
  final bool? isOpen;

  UiClub({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.coverUrl,
    required this.address,
    required this.isOpen,
  });

  factory UiClub.fromJson(Map<String, dynamic> json) => _$UiClubFromJson(json);

  Map<String, dynamic> toJson() => _$UiClubToJson(this);
}

@JsonSerializable()
class UiClubDetail {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'logoUrl')
  final String? logoUrl;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'covers')
  final List<String> covers;

  @JsonKey(name: 'googleRating')
  final double? googleRating;

  @JsonKey(name: 'googleUserRatingsTotal')
  final int? googleUserRatingsTotal;

  @JsonKey(name: 'socialNetworks')
  final List<UiClubSocialNetwork> socialNetworks;

  UiClubDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.address,
    required this.covers,
    required this.googleRating,
    required this.googleUserRatingsTotal,
    required this.socialNetworks,
  });

  factory UiClubDetail.fromJson(Map<String, dynamic> json) =>
      _$UiClubDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UiClubDetailToJson(this);
}

@JsonSerializable()
class UiClubSocialNetwork {
  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'name')
  final String name;

  UiClubSocialNetwork({
    required this.url,
    required this.code,
    required this.name,
  });

  factory UiClubSocialNetwork.fromJson(Map<String, dynamic> json) =>
      _$UiClubSocialNetworkFromJson(json);

  Map<String, dynamic> toJson() => _$UiClubSocialNetworkToJson(this);
}

@JsonSerializable()
class AppScreenFlagDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'screenKey')
  final String screenKey;

  @JsonKey(name: 'isActive')
  final int isActive;

  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

  AppScreenFlagDto({
    required this.id,
    required this.screenKey,
    required this.isActive,
    required this.updatedAt,
  });

  AppScreenFlag toDomain() {
    AppScreenKeys? screen;
    switch (screenKey) {
      case 'app':
        screen = AppScreenKeys.app;
        break;
      case 'home':
        screen = AppScreenKeys.home;
        break;
      default:
        screen = null;
    }

    return AppScreenFlag(
      id: id,
      screen: screen,
      isActive: isActive == 1,
      updatedAt: updatedAt,
    );
  }

  factory AppScreenFlagDto.fromJson(Map<String, dynamic> json) =>
      _$AppScreenFlagDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AppScreenFlagDtoToJson(this);
}
