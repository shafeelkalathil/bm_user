import 'package:geocoding/geocoding.dart';

class LocationSearchResult {
  final String address;
  final double latitude;
  final double longitude;
  final String? placeName;
  final Placemark fullPlacemark;

  const LocationSearchResult({
    required this.address,
    required this.latitude,
    required this.longitude,
    this.placeName,
    required this.fullPlacemark,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LocationSearchResult &&
              runtimeType == other.runtimeType &&
              latitude == other.latitude &&
              longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() => 'LocationSearchResult(address: $address, lat: $latitude, lng: $longitude)';
}