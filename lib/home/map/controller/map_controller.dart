
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/home/map/service/geo_locator_service.dart';
import 'package:flutter_api_learning/home/map/service/place_search.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as converter;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends SuperController<dynamic> {

  final  currentPosition = Rxn<Position>();
  final geoLocationService = GeoLocatorServices();
  GoogleMapController? googleMapController ;
  Location _location = Location();
  TextEditingController searchController = TextEditingController();
  final String apiKey = 'AIzaSyCyD85xcULxLAUHYuCpTPkFAV1GHyFpJ2o';

  void onMapCreated(GoogleMapController controller) async {
    googleMapController = controller;
    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(currentPosition.value!.latitude, currentPosition.value!.longitude), zoom: 18),
      ),
    );
    // _location.onLocationChanged.listen((l) {
    //
    // });
  }

  Future<List<PlaceSearch>> getAutoCompletePlaces(String search) async{
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = converter.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  @override
  void onInit() {
    debugPrint("auth controller init");
    super.onInit();
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
    currentPosition.value = await geoLocationService.getCurrentLocation();}

  @override
  void onReady() {
    super.onReady();
    setCurrentLocation();
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
