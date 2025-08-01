import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/presentation/components/card_club.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:festiva/presentation/pages/clubs_map/components/map_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubsMapPage extends StatefulWidget {
  const ClubsMapPage({super.key});

  @override
  State<ClubsMapPage> createState() => _ClubsMapPageState();
}

class _ClubsMapPageState extends State<ClubsMapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClubsMapProvider>(
        context,
        listen: false,
      ).getClubLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubsMapProvider>(context);
    //if (provider.locations.isEmpty) {
    //  return Center(child: CircularProgressIndicator());
    //}
    return Stack(
      children: [
        if (provider.locations.isNotEmpty) MapComponent(),
        if (provider.clubSelected != null)
          _clubSelected(
            provider.clubSelected!,
          ),
      ],
    );
  }

  Widget _clubSelected(ClubLocation club) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CardClub(
          id: club.idClub,
          name: club.club,
          coverUrl: club.coverUrl,
          logoUrl: club.logoUrl,
          address: club.address,
          isOpen: null,
        ),
      ),
    );
  }
}
