import 'package:festiva_flutter/presentation/components/card_artist.dart';
import 'package:festiva_flutter/presentation/providers/artist_provider.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pr = Provider.of<ArtistProvider>(context, listen: false);
      pr.getArtists();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArtistProvider>(context);
    return AppScaffold(
      child: ListView.builder(
        itemCount: provider.artists.length,
        itemBuilder: (context, index) {
          final artist = provider.artists[index];
          return CardArtist(
            artist: artist,
          );
        },
      ),
    );
  }
}
