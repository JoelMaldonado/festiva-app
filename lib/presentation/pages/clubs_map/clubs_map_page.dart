import 'package:festiva_flutter/presentation/components/card_club.dart';
import 'package:festiva_flutter/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:festiva_flutter/presentation/pages/clubs_map/components/maps_page.dart';
import 'package:festiva_flutter/presentation/pages/club_detail/club_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubsMapPage extends StatefulWidget {
  const ClubsMapPage({super.key});

  @override
  State<ClubsMapPage> createState() => _ClubsMapPageState();
}

class _ClubsMapPageState extends State<ClubsMapPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubsMapProvider>(context);
    return Stack(
      children: [
        MapsPage(),
        if (provider.clubSelected != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CardClub(
                club: provider.clubSelected!,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ClubDetailPage(
                        idClub: provider.clubSelected!.id,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
