// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
//
// import '../services/location_service.dart';
//
// class LocationProvider with ChangeNotifier {
//   bool _isLoading = false;
//   bool _hasPermission = false;
//   String? _errorMessage;
//   double? _latitude;
//   double? _longitude;
//   String? _currentAddress;
//   Placemark? _currentPlaceMark;
//
//   // Getters
//   bool get isLoading => _isLoading;
//   bool get hasPermission => _hasPermission;
//   String? get errorMessage => _errorMessage;
//   double? get latitude => _latitude;
//   double? get longitude => _longitude;
//   String? get currentAddress => _currentAddress;
//   Placemark? get currentPlacemark => _currentPlaceMark;
//
//   void setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }
//
//   void setError(String? error) {
//     _errorMessage = error;
//     notifyListeners();
//   }
//
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }
//
//   Future<bool> getCurrentLocation() async {
//     setLoading(true);
//     clearError();
//
//     final result = await LocationService.getCurrentLocation();
//
//     setLoading(false);
//
//     if (result.success) {
//       _hasPermission = true;
//       _latitude = result.latitude;
//       _longitude = result.longitude;
//       _currentAddress = result.address;
//       _currentPlaceMark = result.placemark;
//       notifyListeners();
//       return true;
//     } else {
//       _hasPermission = false;
//       setError(result.message);
//
//       // Handle different error cases
//       if (result.needsServiceEnable) {
//         await LocationService.openLocationSettings();
//       } else if (result.needsSettingsOpen) {
//         await LocationService.openAppSettings();
//       }
//
//       return false;
//     }
//   }
//
//   void setManualLocation(double lat, double lng, String address) {
//     _latitude = lat;
//     _longitude = lng;
//     _currentAddress = address;
//     _hasPermission = true;
//     notifyListeners();
//   }
//
//   void clearLocation() {
//     _latitude = null;
//     _longitude = null;
//     _currentAddress = null;
//     _currentPlaceMark = null;
//     _hasPermission = false;
//     clearError();
//     notifyListeners();
//   }
//
//   String get shortAddress {
//     if (_currentAddress == null) return 'Unknown location';
//
//     List<String> parts = _currentAddress!.split(', ');
//     if (parts.length > 2) {
//       return '${parts[0]}, ${parts[1]}';
//     }
//     return _currentAddress!;
//   }
// }

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../services/location_service.dart';

class LocationProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _hasPermission = false;
  String? _errorMessage;
  double? _latitude;
  double? _longitude;
  String? _currentAddress;
  Placemark? _currentPlaceMark;

  // Getters
  bool get isLoading => _isLoading;
  bool get hasPermission => _hasPermission;
  String? get errorMessage => _errorMessage;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get currentAddress => _currentAddress;
  Placemark? get currentPlacemark => _currentPlaceMark;

  // Add these getters that your LocationManuallyScreen is looking for
  double? get currentLatitude => _latitude;
  double? get currentLongitude => _longitude;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<bool> getCurrentLocation() async {
    setLoading(true);
    clearError();

    final result = await LocationService.getCurrentLocation();

    setLoading(false);

    if (result.success) {
      _hasPermission = true;
      _latitude = result.latitude;
      _longitude = result.longitude;
      _currentAddress = result.address;
      _currentPlaceMark = result.placemark;
      notifyListeners();
      return true;
    } else {
      _hasPermission = false;
      setError(result.message);

      // Handle different error cases
      if (result.needsServiceEnable) {
        await LocationService.openLocationSettings();
      } else if (result.needsSettingsOpen) {
        await LocationService.openAppSettings();
      }

      return false;
    }
  }

  void setManualLocation(double lat, double lng, String address) {
    _latitude = lat;
    _longitude = lng;
    _currentAddress = address;
    _hasPermission = true;
    clearError(); // Clear any previous errors
    notifyListeners();
  }

  void clearLocation() {
    _latitude = null;
    _longitude = null;
    _currentAddress = null;
    _currentPlaceMark = null;
    _hasPermission = false;
    clearError();
    notifyListeners();
  }

  String get shortAddress {
    if (_currentAddress == null) return 'Unknown location';

    List<String> parts = _currentAddress!.split(', ');
    if (parts.length > 2) {
      return '${parts[0]}, ${parts[1]}';
    }
    return _currentAddress!;
  }
}
