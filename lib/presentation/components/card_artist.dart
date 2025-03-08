import 'package:festiva_flutter/domain/model/artist.dart';
import 'package:festiva_flutter/presentation/pages/detail_artist_page.dart';
import 'package:festiva_flutter/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CardArtist extends StatelessWidget {
  final Artist artist;

  const CardArtist({
    super.key,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailArtistPage(
              idArtist: artist.id,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 72,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                artist.urlFoto,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              artist.nombre,
              style: AppTextStyles.caption2,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
