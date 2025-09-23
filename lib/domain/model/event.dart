class Event {
  final int id;
  final int eventId;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime? eventDate;
  final DateTime? startTime;
  final int? idEventCategory;
  final String? nameEventCategory;
  final String? location;
  final String? nameClub;
  final int? clubId;
  final String? clubName;

  Event({
    required this.id,
    required this.eventId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.eventDate,
    required this.startTime,
    required this.idEventCategory,
    required this.nameEventCategory,
    required this.location,
    required this.nameClub,
    required this.clubId,
    required this.clubName,
  });
}
