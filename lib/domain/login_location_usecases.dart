import 'package:geolocator/geolocator.dart';

class Location {
  Future<void> startLocationUpdates() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }
}// TODO Implement this library.