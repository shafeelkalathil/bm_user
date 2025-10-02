import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<LocationResult> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationResult(
          success: false,
          message: 'Location services are disabled. Please enable them in settings.',
          needsServiceEnable: true,
        );
      }

      // Check permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return LocationResult(
            success: false,
            message: 'Location permission denied. Please allow location access.',
            needsPermission: true,
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return LocationResult(
          success: false,
          message:
              'Location permissions are permanently denied. Please enable them in app settings.',
          needsSettingsOpen: true,
        );
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 15),
      );

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String address = 'Unknown location';
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address = _formatAddress(place);
      }

      return LocationResult(
        success: true,
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        placemark: placemarks.isNotEmpty ? placemarks[0] : null,
      );
    } catch (e) {
      return LocationResult(
        success: false,
        message: 'Failed to get location: ${e.toString()}',
      );
    }
  }

  static String _formatAddress(Placemark place) {
    List<String> addressParts = [];

    if (place.name != null && place.name!.isNotEmpty) {
      addressParts.add(place.name!);
    }
    if (place.street != null && place.street!.isNotEmpty) {
      addressParts.add(place.street!);
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      addressParts.add(place.locality!);
    }
    if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
      addressParts.add(place.administrativeArea!);
    }
    if (place.country != null && place.country!.isNotEmpty) {
      addressParts.add(place.country!);
    }

    return addressParts.join(', ');
  }

  static Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  static Future<void> openAppSettings() async {
    await openAppSettings();
  }
}

// Location Result Model
class LocationResult {
  final bool success;
  final double? latitude;
  final double? longitude;
  final String? address;
  final String? message;
  final Placemark? placemark;
  final bool needsPermission;
  final bool needsServiceEnable;
  final bool needsSettingsOpen;

  LocationResult({
    required this.success,
    this.latitude,
    this.longitude,
    this.address,
    this.message,
    this.placemark,
    this.needsPermission = false,
    this.needsServiceEnable = false,
    this.needsSettingsOpen = false,
  });
}
