class ClubSchedule {
  final int id;
  final int dayOfWeek;
  final String name;
  final DateTime openingTime;
  final DateTime closingTime;

  ClubSchedule({
    required this.id,
    required this.dayOfWeek,
    required this.name,
    required this.openingTime,
    required this.closingTime,
  });
}
