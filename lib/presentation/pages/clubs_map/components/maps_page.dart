import 'package:festiva/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;
import 'package:provider/provider.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({
    super.key,
  });

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClubsMapProvider>(
        context,
        listen: false,
      ).setupPositionTracking();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubsMapProvider>(context);
    return Column(
      children: [
        Expanded(
          child: mp.MapWidget(
            onMapCreated: provider.onMapCreated,
            styleUri: mp.MapboxStyles.DARK,
          ),
        ),
      ],
    );
  }
}
