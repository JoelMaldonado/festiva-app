import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/presentation/pages/artist_detail/detail_artist_page.dart';
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
    return SizedBox(
      width: 72,
      child: Column(
        spacing: 6,
        children: [
          GestureDetector(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AppImageNetwork(
                imageUrl: artist.urlFoto,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            artist.nombre,
            style: AppTextStyles.caption2,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
