class ClubLocation {
  final int idClub;
  final String club;
  final String address;
  final double latitude;
  final double longitude;
  final String? logoUrl;
  final String? coverUrl;

  ClubLocation({
    required this.idClub,
    required this.club,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.logoUrl,
    required this.coverUrl,
  });
}
