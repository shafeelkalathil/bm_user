import 'package:geocoding/geocoding.dart';

import '../../features/shared/models/location_search_result.dart';

class LocationSearchService {
  static const int _maxResults = 5;
  static const int _minQueryLength = 3;

  Future<List<LocationSearchResult>> searchLocations(String query) async {
    if (query.length < _minQueryLength) {
      return [];
    }

    try {
      final locations = await locationFromAddress(query);
      final results = <LocationSearchResult>[];

      for (final location in locations.take(_maxResults)) {
        try {
          final result = await _createLocationResult(location);
          if (result != null) {
            results.add(result);
          }
        } catch (e) {
          // Skip invalid locations
          continue;
        }
      }

      return results;
    } catch (error) {
      throw Exception('Failed to search locations: $error');
    }
  }

  Future<LocationSearchResult?> _createLocationResult(Location location) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isEmpty) return null;

      final place = placemarks.first;
      final address = _formatAddress(place);

      return LocationSearchResult(
        address: address,
        latitude: location.latitude,
        longitude: location.longitude,
        placeName: place.locality ?? place.subAdministrativeArea,
        fullPlacemark: place,
      );
    } catch (e) {
      return null;
    }
  }

  String _formatAddress(Placemark place) {
    final addressParts = <String>[
      if (place.street?.isNotEmpty == true) place.street!,
      if (place.locality?.isNotEmpty == true) place.locality!,
      if (place.administrativeArea?.isNotEmpty == true) place.administrativeArea!,
      if (place.country?.isNotEmpty == true) place.country!,
    ];

    return addressParts.join(', ');
  }
}