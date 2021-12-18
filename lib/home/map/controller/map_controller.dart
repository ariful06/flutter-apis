
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/home/map/service/geo_locator_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends SuperController<dynamic> {

  late Rx<Position?>? currentPosition;
  final geoLocationService = GeoLocatorServices();

  GoogleMapController? googleMapController;

  Location _location = Location();
  TextEditingController searchController = TextEditingController();

  void onMapCreated(GoogleMapController _cntlr) {
    googleMapController = _cntlr;
    _location.onLocationChanged.listen((l) {
      googleMapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 18),
        ),
      );
    });
  }


  @override
  void onInit() {
    debugPrint("auth controller init");
    super.onInit();
    setCurrentLocation();
  }
  setCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    currentPosition?.value = await geoLocationService.getCurrentLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onDetached() {
    debugPrint('onDetached called');
  }

  @override
  void onInactive() {
    debugPrint('onInactive called');
  }

  @override
  void onPaused() {
    debugPrint('onPaused called');
  }

  @override
  void onResumed() {
    debugPrint('onResumed called');
  }
}
