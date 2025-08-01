import 'package:geolocator/geolocator.dart';

class LatLng {
  final double latitude;
  final double longitude;

  LatLng({
    required this.latitude,
    required this.longitude,
  });
}

Future<LatLng?> getMyLocation() async {
  try {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica si el GPS está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    // Solicita permisos si es necesario
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    // Configura los nuevos LocationSettings
    final settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 0,
    );

    // Obtiene la ubicación actual
    final position = await Geolocator.getCurrentPosition(
      locationSettings: settings,
    );

    return LatLng(latitude: position.latitude, longitude: position.longitude);
  } catch (_) {
    return null;
  }
}
