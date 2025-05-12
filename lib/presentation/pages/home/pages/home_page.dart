import 'package:festiva_flutter/presentation/components/card_artist.dart';
import 'package:festiva_flutter/presentation/components/card_club.dart';
import 'package:festiva_flutter/presentation/components/card_event.dart';
import 'package:festiva_flutter/presentation/pages/artists_page.dart';
import 'package:festiva_flutter/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva_flutter/presentation/pages/home/components/home_button_search.dart';
import 'package:festiva_flutter/presentation/pages/home/providers/home_provider.dart';
import 'package:festiva_flutter/presentation/pages/home/pages/home_search_page.dart';
import 'package:festiva_flutter/presentation/providers/artist_provider.dart';
import 'package:festiva_flutter/presentation/providers/club_provider.dart';
import 'package:festiva_flutter/presentation/providers/event_provider.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toClubs;
  final VoidCallback toEvents;

  const HomePage({
    super.key,
    required this.toClubs,
    required this.toEvents,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).init();
      Provider.of<ArtistProvider>(context, listen: false).getArtists();
      Provider.of<ClubProvider>(context, listen: false).getClubs();
      Provider.of<EventProvider>(context, listen: false).getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final artistProvider = Provider.of<ArtistProvider>(context);
    final clubProvider = Provider.of<ClubProvider>(context);
    final eventProvider = Provider.of<EventProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 16),
            Column(
              children: [
                HomeButtonSearch(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeSearchPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _section(
                  title: "Categorías",
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 24,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.eventCategories.length,
                    itemBuilder: (context, index) {
                      final item = provider.eventCategories[index];
                      return _chipCategory(
                        text: item.title,
                        isSelected: provider.categorySelected == item.id,
                        onPressed: () {
                          provider.setCategorySelected(item.id);
                        },
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                  ),
                ),
                const SizedBox(height: 16),
                _section(
                  title: "Clubs",
                  onPressed: widget.toClubs,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: clubProvider.clubs.length,
                    itemBuilder: (context, index) {
                      final item = clubProvider.clubs[index];
                      return CardClub(
                        club: item,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ClubDetailPage(
                                idClub: item.id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _section(
                  title: "Eventos",
                  onPressed: widget.toEvents,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: eventProvider.events.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final item = eventProvider.events[index];
                      return CardEvent(
                        event: item,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                _section(
                  title: "Artistas",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ArtistsPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: artistProvider.artists.length,
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final item = artistProvider.artists[index];
                      return CardArtist(
                        artist: item,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _top() {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo_large.png",
                width: 140,
                fit: BoxFit.fitWidth,
              ),
              Text(
                "¿A dónde iremos hoy?",
                style: AppTextStyles.callout.copyWith(
                  color: AppColors.colorT2,
                ),
              )
            ],
          ),
        ),
        AppFloatingActionButton(
          onPressed: () {},
          icon: Icons.logout,
        ),
      ],
    );
  }

  Widget _chipCategory({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 24,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16),
          textStyle: AppTextStyles.caption1,
          foregroundColor: AppColors.colorT1,
          side: BorderSide(
            color: isSelected ? AppColors.colorP1 : AppColors.colorT2,
            width: 1,
          ),
        ),
        child: Text(text),
      ),
    );
  }

  Row _section({
    required String title,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.colorT1,
            ),
          ),
        ),
        onPressed == null
            ? SizedBox.shrink()
            : TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.colorT2,
                  textStyle: AppTextStyles.footnote,
                ),
                child: Text("Ver más"),
              ),
      ],
    );
  }
}
