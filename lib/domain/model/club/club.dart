class Club {
  final int id;
  final String nombre;
  final String descrip;
  final String urlLogo;
  final String urlPortada;
  final String direc;
  final String urlMaps;
  final String telf;
  final List<ClubSocialRed> socialReds;

  Club({
    required this.id,
    required this.nombre,
    required this.descrip,
    required this.urlLogo,
    required this.urlPortada,
    required this.direc,
    required this.urlMaps,
    required this.telf,
    required this.socialReds,
  });
}

class ClubSocialRed {
  final String url;
  final String red;
  final String cod;
  final String logo;

  ClubSocialRed({
    required this.url,
    required this.red,
    required this.cod,
    required this.logo,
  });
}
