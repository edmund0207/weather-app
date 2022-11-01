import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  double latitude = 0;
  double longitude = 0;

  Future getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
