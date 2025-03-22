class Club {
  final int id;
  final String name;
  final String descrip;
  final String phone;
  final String logoUrl;
  final String coverUrl;
  final String address;
  final String mapsUrl;
  final List<ClubSocialRed> socialReds;

  Club({
    required this.id,
    required this.name,
    required this.descrip,
    required this.phone,
    required this.logoUrl,
    required this.coverUrl,
    required this.address,
    required this.mapsUrl,
    required this.socialReds,
  });
}

class ClubSocialRed {
  final int id;
  final String name;
  final String url;

  ClubSocialRed({
    required this.id,
    required this.name,
    required this.url,
  });
}
