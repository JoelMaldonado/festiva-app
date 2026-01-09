import 'package:festiva/data/model/dto/event_dto.dart';
import 'package:festiva/domain/model/event_category.dart';

class Event {
  final int id;
  final int eventId;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime? eventDate;
  final DateTime? startTime;
  final String? location;
  final String? nameClub;
  final int? clubId;
  final String? clubName;
  final String? nameCategory;
  final String? ticketUrl;
  final List<CategoryResponse> categories;

  Event({
    required this.id,
    required this.eventId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.eventDate,
    required this.startTime,
    required this.location,
    required this.nameClub,
    required this.clubId,
    required this.clubName,
    required this.nameCategory,
    required this.ticketUrl,
    required this.categories,
  });

  String? get randomCategory {
    if (categories.isNotEmpty) {
      return categories.first.title;
    } else {
      return null;
    }
  }
}

class EventDetail {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String location;
  final int clubId;
  final String clubName;
  final String clubLogoUrl;
  final String? ticketUrl;

  final List<EventCategory> categories;
  final List<EventSchedule> schedules;

  EventDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.clubId,
    required this.clubName,
    required this.clubLogoUrl,
    required this.ticketUrl,
    required this.categories,
    required this.schedules,
  });
}

class EventSchedule {
  final int id;
  final DateTime eventDate;
  final DateTime startTime;

  EventSchedule({
    required this.id,
    required this.eventDate,
    required this.startTime,
  });
}
