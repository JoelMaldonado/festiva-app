class Artist {
  final int id;
  final String nombre;
  final String tipo;
  final String descrip;
  final String biografia;
  final String tags;
  final String? urlFoto;
  final String? urlFoto2;
  final List<ArtistSocialRed> socialReds;

  Artist({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.descrip,
    required this.biografia,
    required this.tags,
    required this.urlFoto,
    required this.urlFoto2,
    required this.socialReds,
  });
}

class ArtistSocialRed {
  final int id;
  final String url;
  final String code;
  final String name;

  ArtistSocialRed({
    required this.id,
    required this.url,
    required this.code,
    required this.name,
  });
}
