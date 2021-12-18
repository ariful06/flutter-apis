
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/home/map/service/geo_locator_service.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier{
  final geoLocationService = GeoLocatorServices();
  // variable

  late Position currentLocation;

  ApplicationBloc(){
    setCurrentLocation();
  }
  setCurrentLocation() async {
    currentLocation = await geoLocationService.getCurrentLocation();
    notifyListeners();
  }
}