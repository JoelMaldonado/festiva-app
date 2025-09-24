import 'package:festiva/app/router.dart';
import 'package:festiva/presentation/components/card_item_list.dart';
import 'package:festiva/presentation/pages/home/components/search_component.dart';
import 'package:festiva/presentation/providers/artist_provider.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      appBar: CustomAppBar(
        title: "Artists",
        detail: "Get to know them better here",
      ),
      child: Column(
        spacing: 16,
        children: [
          SearchComponent(),
          Expanded(
            child: ListView.separated(
              itemCount: provider.artists.length,
              itemBuilder: (context, index) {
                final artist = provider.artists[index];
                return CardItemList(
                  imageUrl: artist.urlFoto,
                  label: artist.nombre,
                  detail: artist.tipo,
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRoutes.detailArtist,
                      extra: artist.id,
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
          ),
        ],
      ),
    );
  }
}
