import 'package:geolocator/geolocator.dart';

class GeoLocatorServices {

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
