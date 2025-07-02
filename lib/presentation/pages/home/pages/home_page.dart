import 'package:festiva/presentation/components/card_artist.dart';
import 'package:festiva/presentation/components/card_club.dart';
import 'package:festiva/presentation/components/card_event.dart';
import 'package:festiva/presentation/pages/artists/artists_page.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/pages/home/components/home_button_search.dart';
import 'package:festiva/presentation/pages/home/pages/home_search_page.dart';
import 'package:festiva/presentation/providers/artist_provider.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/providers/event_provider.dart';
import 'package:festiva/presentation/theme/theme.dart';
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
      Provider.of<ArtistProvider>(context, listen: false).getArtists();
      Provider.of<ClubProvider>(context, listen: false).getClubs();
      Provider.of<EventProvider>(context, listen: false).getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final artistProvider = Provider.of<ArtistProvider>(context);
    final clubProvider = Provider.of<ClubProvider>(context);
    final eventProvider = Provider.of<EventProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 24),
          _top(),
          const SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: HomeButtonSearch(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeSearchPage(),
                      ),
                    );
                  },
                ),
              ),
              //HomeCategories(),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CardClub(
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
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              _section(
                title: "Events",
                onPressed: widget.toEvents,
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                title: "Artists",
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  separatorBuilder: (context, index) => SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final item = artistProvider.artists[index];
                    return CardArtist(
                      artist: item,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
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
                  "Where are we going today?",
                  style: AppTextStyles.callout.copyWith(
                    color: AppColors.colorT2,
                  ),
                )
              ],
            ),
          ),
          //AppFloatingActionButton(
          //  onPressed: () {},
          //  icon: Icons.logout,
          //),
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
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
      ),
    );
  }
}
