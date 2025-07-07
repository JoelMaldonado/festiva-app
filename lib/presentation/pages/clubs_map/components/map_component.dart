import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapComponent extends StatefulWidget {
  final List<PointAnnotationOptions> locations;

  const MapComponent({
    super.key,
    required this.locations,
  });

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  MapboxMap? mapboxMap;
  PointAnnotationManager? pointManager;
  bool isTracking = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          styleUri: MapboxStyles.DARK,
          onMapCreated: (controller) async {
            if (mapboxMap == null) {
              mapboxMap = controller;
              pointManager =
                  await mapboxMap!.annotations.createPointAnnotationManager();
              await pointManager?.createMulti(widget.locations);
              await findMyLocation();
            }
          },
        ),
        Positioned(
          top: 24,
          right: 24,
          child: FloatingActionButton(
            onPressed: isTracking ? null : findMyLocation,
            shape: CircleBorder(),
            backgroundColor: AppColors.colorB1,
            foregroundColor: AppColors.colorT1,
            child: isTracking
                ? const CircularProgressIndicator()
                : const Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }

  Future<void> findMyLocation() async {
    setState(() => isTracking = true);
    final myLocation = await getMyLocation();
    if (myLocation == null) {
      setState(() => isTracking = false);
      return;
    }
    await mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            myLocation.longitude,
            myLocation.latitude,
          ),
        ),
        zoom: 17,
      ),
      MapAnimationOptions(
        duration: 2000,
      ),
    );
    setState(() => isTracking = false);
  }
}
