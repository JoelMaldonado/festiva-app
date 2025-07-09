import 'dart:io';

import 'package:festiva/main.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as img;

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

class ImageCacheService {
  final Directory dir;

  ImageCacheService({
    required this.dir,
  });

  Future<Uint8List> getCachedOrDownload(String url, String filename) async {
    final file = File('${dir.path}/$filename');
    if (await file.exists()) {
      tagito.i("Imagen encontrada: $filename");
      return await file.readAsBytes();
    } else {
      tagito.i("Descargando imagen: $filename");
      return (await downloadAndCacheImage(url, filename)).readAsBytes();
    }
  }

  Future<File> downloadAndCacheImage(String url, String filename) async {
    final response = await NetworkAssetBundle(Uri.parse(url)).load("");
    final bytes = response.buffer.asUint8List();

    final resizedBytes = await resizeImageBytes(bytes, 150, 150);

    final file = File('${dir.path}/$filename');

    await file.writeAsBytes(resizedBytes);
    return file;
  }

  Future<Uint8List> resizeImageBytes(
    Uint8List bytes,
    int width,
    int height,
  ) async {
    final original = img.decodeImage(bytes);
    if (original == null) {
      throw Exception("No se pudo decodificar la imagen");
    }
    final resized = img.copyResize(original, width: width, height: height);
    return Uint8List.fromList(img.encodePng(resized));
  }
}
