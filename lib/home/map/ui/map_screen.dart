import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_learning/home/map/controller/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends GetView<MapController>{
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          TextFormField(
            decoration: InputDecoration(
              hintText: "Search Here",
              icon: IconButton(
                onPressed:(){}, icon: const Icon(Icons.search) ,
              )
            ),
            controller: controller.searchController,
          ),
          if (controller.currentPosition == null) const CircularProgressIndicator() else GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(controller.currentPosition!.value!.latitude,controller.currentPosition!.value!.longitude)),
          mapType: MapType.normal,
          onMapCreated: controller.onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        )
        ]
      ),
    );
  }
}
