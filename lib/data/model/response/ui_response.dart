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
