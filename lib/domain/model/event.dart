class Event {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime? eventDatetime;
  final String createdAt;
  final String updatedAt;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.eventDatetime,
    required this.createdAt,
    required this.updatedAt,
  });
}
