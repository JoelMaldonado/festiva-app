import 'package:festiva_flutter/data/model/dto/club/club_dto.dart';
import 'package:festiva_flutter/domain/model/club/club.dart';

extension ClubDtoMapper on ClubDto {
  Club toDomain() {
    return Club(
      id: id,
      name: name ?? '',
      description: description ?? '',
      emails: emails,
      phones: phones,
      logoUrl: logoUrl ?? '',
      covers: covers,
      address: address.map((e) => e.toDomain()).toList(),
      schedules: schedules.map((e) => e.toDomain()).toList(),
      socialNetworks: socialNetworks.map((e) => e.toDomain()).toList(),
    );
  }
}

extension ClubAddressDtoMapper on ClubAddressDto {
  ClubAddress toDomain() {
    return ClubAddress(
      id: id ?? 0,
      address: address ?? '',
      mapsUrl: mapsUrl,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

extension ClubScheduleDtoMapper on ClubScheduleDto {
  ClubSchedule toDomain() {
    return ClubSchedule(
      id: id ?? 0,
      dayOfWeek: dayOfWeek ?? 0,
      name: name ?? '',
      openingTime: openingTime ?? '',
      closingTime: closingTime ?? '',
    );
  }
}

extension ClubSocialNetworkDtoMapper on ClubSocialNetworkDto {
  ClubSocialNetwork toDomain() {
    return ClubSocialNetwork(
      id: id ?? 0,
      url: url ?? '',
      socialNetwork: socialNetwork?.toDomain() ??
          SocialNetwork(id: 0, name: '', logoUrl: ''),
    );
  }
}

extension SocialNetworkDtoMapper on SocialNetwork {
  SocialNetwork toDomain() {
    return SocialNetwork(
      id: id,
      name: name,
      logoUrl: logoUrl,
    );
  }
}
