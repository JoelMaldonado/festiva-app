import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';

final Map<String, ClubLocation> annotationMap = {};

class MapComponent extends StatefulWidget {
  const MapComponent({
    super.key,
  });

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  MapboxMap? mapboxMap;
  bool isTracking = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubsMapProvider>(context);
    return provider.isLoading
        ? CircularProgressIndicator()
        : Stack(
            children: [
              MapWidget(
                styleUri: MapboxStyles.DARK,
                cameraOptions: CameraOptions(
                  center: Point(coordinates: Position(10.7522, 59.9139)),
                  zoom: 15,
                ),
                onMapCreated: (controller) async {
                  if (mapboxMap == null) {
                    mapboxMap = controller;
                    final pointManager = await mapboxMap!.annotations
                        .createPointAnnotationManager();

                    final annotations2 = <PointAnnotation>[];

                    for (final location in provider.locations) {
                      final imgData = await _loadImage(
                          'assets/clubs/${location.idClub}.png');

                      final geometry = Point(
                        coordinates: Position(
                          location.longitude,
                          location.latitude,
                        ),
                      );

                      final option = PointAnnotationOptions(
                        geometry: geometry,
                        image: imgData,
                        iconSize: 1.0,
                      );
                      final annotation = await pointManager.create(option);
                      annotationMap[annotation.id] = location;
                      annotations2.add(annotation);
                    }
                    pointManager.addOnPointAnnotationClickListener(
                      MyPointAnnotationClickListener(
                        onPressed: (ant) {
                          final club = annotationMap[ant.id];
                          provider.setClub(club);
                        },
                      ),
                    );

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

  Future<Uint8List> _loadImage(String path) async {
    try {
      final ByteData bytes = await rootBundle.load(path);
      return bytes.buffer.asUint8List();
    } on FlutterError {
      final ByteData bytes = await rootBundle.load("assets/clubs/0.png");
      return bytes.buffer.asUint8List();
    }
  }

  Future<void> findMyLocation() async {
    setState(() => isTracking = true);
    final myLocation = await getMyLocation();
    if (myLocation == null) {
      setState(() => isTracking = false);
      return;
    }
    final position = Position(
      myLocation.longitude,
      myLocation.latitude,
    );
    await mapboxMap?.flyTo(
      CameraOptions(
        center: Point(coordinates: position),
        zoom: 17,
      ),
      MapAnimationOptions(duration: 2000),
    );
    setState(() => isTracking = false);
  }
}

class MyPointAnnotationClickListener extends OnPointAnnotationClickListener {
  final Function(PointAnnotation) onPressed;

  MyPointAnnotationClickListener({
    required this.onPressed,
  });

  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    onPressed.call(annotation);
  }
}
