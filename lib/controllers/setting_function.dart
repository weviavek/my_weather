import 'package:geolocator/geolocator.dart';

class LocationSetting {
  static void goToSettings() {
    Geolocator.openAppSettings();
  }
}
