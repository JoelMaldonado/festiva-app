import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/presentation/pages/detail_artist_page.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
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
              child: AppImageNetwork(
                imageUrl: artist.urlFoto,
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
