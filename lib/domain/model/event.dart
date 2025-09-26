import 'package:festiva/data/model/dto/event_dto.dart';

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
