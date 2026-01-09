import 'package:festiva/app/router.dart';
import 'package:festiva/presentation/components/card_artist_shimmer.dart';
import 'package:festiva/presentation/pages/home/components/carousel_artists_component.dart';
import 'package:festiva/presentation/pages/home/components/carousel_clubs_component.dart';
import 'package:festiva/presentation/pages/home/components/carousel_events_component.dart';
import 'package:festiva/presentation/pages/home/components/search_component.dart';
import 'package:festiva/presentation/pages/home/home_provider.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      Provider.of<HomeProvider>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
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
                child: SearchComponent(),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  _section(
                    title: "Clubs",
                    onPressed: widget.toClubs,
                  ),
                  CarouselClubsComponent(
                    clubs: provider.listClubs,
                    isLoading: provider.isLoading,
                    durationInSeconds: 5,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (provider.listEvents.isNotEmpty)
                Column(
                  children: [
                    _section(
                      title: "Events",
                      onPressed: widget.toEvents,
                    ),
                    CarouselEventsComponent(
                      key: const Key("carousel_events"),
                      events: provider.listEvents,
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              if (provider.listArtists.isNotEmpty || provider.isLoading)
                Column(
                  children: [
                    _section(
                      title: "Artists",
                      onPressed: () {
                        GoRouter.of(context).push(AppRoutes.artistList);
                      },
                    ),
                    provider.isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              4,
                              (_) => const CardArtistShimmer(),
                            ),
                          )
                        : CarouselArtistsComponent(
                            key: const Key("carousel_artists"),
                            artists: provider.listArtists,
                          ),
                  ],
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    kDebugMode
                        ? Text(
                            "Festiva Debug",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Image.asset(
                            "assets/images/logo_large.png",
                            width: 140,
                            fit: BoxFit.fitWidth,
                          ),
                  ],
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
    required VoidCallback onPressed,
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
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.colorT2,
              textStyle: AppTextStyles.footnote,
            ),
            child: Text("See all"),
          ),
        ],
      ),
    );
  }
}
