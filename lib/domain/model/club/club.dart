import 'package:festiva/data/model/dto/club/club_dto.dart';

class Club {
  final int? id;
  final String name;
  final String description;
  final List<String> emails;
  final List<String> phones;
  final String logoUrl;
  final List<String> covers;
  final List<ClubAddress> address;
  final List<ClubSchedule> schedules;
  final List<ClubSocialNetwork> socialNetworks;

  Club({
    required this.id,
    required this.name,
    required this.description,
    required this.emails,
    required this.phones,
    required this.logoUrl,
    required this.covers,
    required this.address,
    required this.schedules,
    required this.socialNetworks,
  });
}

class ClubAddress {
  final int id;
  final String address;
  final String? mapsUrl;
  final double? latitude;
  final double? longitude;

  ClubAddress({
    required this.id,
    required this.address,
    required this.mapsUrl,
    required this.latitude,
    required this.longitude,
  });
}

class ClubSchedule {
  final int id;
  final int dayOfWeek;
  final String name;
  final String openingTime;
  final String closingTime;

  ClubSchedule({
    required this.id,
    required this.dayOfWeek,
    required this.name,
    required this.openingTime,
    required this.closingTime,
  });
}

class ClubSocialNetwork {
  final int id;
  final String url;
  final SocialNetwork socialNetwork;

  ClubSocialNetwork({
    required this.id,
    required this.url,
    required this.socialNetwork,
  });
}
