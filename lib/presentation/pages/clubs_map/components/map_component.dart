import 'package:festiva/core/di/di.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:image/image.dart' as img;

class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  late MapboxMap mapboxMap;
  PointAnnotationManager? pointManager;
  bool isTracking = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapWidget(
          styleUri: MapboxStyles.DARK,
          onMapCreated: (controller) async {
            mapboxMap = controller;
            await findMyLocation();
            pointManager =
                await mapboxMap.annotations.createPointAnnotationManager();
            _cargarMarcadores();
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

  Future<void> _cargarMarcadores() async {
    final repo = getIt<ClubRepository>();

    final clubs = await repo.getLocations();

    clubs.fold(
      (l) {},
      (clubs) async {
        for (final club in clubs) {
          final bytes = await NetworkAssetBundle(
            Uri.parse(club.logoUrl),
          ).load("");

          final imgData = bytes.buffer.asUint8List();

          final resized = await resizeImage(imgData, 150);

          final geometry = Point(
            coordinates: Position(
              club.longitude,
              club.latitude,
            ),
          );
          final point = PointAnnotationOptions(
            geometry: geometry,
            image: resized,
            iconSize: 1.0,
          );
          pointManager?.create(point);
        }

        //pointManager?.addOnPointAnnotationClickListener((annotation) {
        //  showClubPopupOrNavigate();
        //});
      },
    );
  }

  Future<Uint8List> resizeImage(Uint8List bytes, int size) async {
    final original = img.decodeImage(bytes)!;
    final resized = img.copyResize(original, width: size, height: size);
    return Uint8List.fromList(img.encodePng(resized));
  }

  Future<void> findMyLocation() async {
    setState(() => isTracking = true);
    final myLocation = await getMyLocation();
    if (myLocation == null) {
      setState(() => isTracking = false);
      return;
    }
    await mapboxMap.flyTo(
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
