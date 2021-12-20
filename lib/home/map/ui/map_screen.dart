import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_learning/home/map/controller/map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends GetView<MapController>{
  const GoogleMapScreen({Key? key}) : super(key: key);
  final LatLng _center = const LatLng(45.521563, -122.677433);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Obx(() =>Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  controller.getAutoCompletePlaces(value);
                },
                decoration: InputDecoration(
                    hintText: "Search Here",
                    suffixIcon: IconButton(
                      onPressed:(){}, icon: const Icon(Icons.search) ,
                    )
                ),
                controller: controller.searchController,
              ),
            ),
            controller.currentPosition.value == null? const CircularProgressIndicator() :Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(target: _center),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: controller.onMapCreated,
              ),
            )
          ]
      ), )

    );
  }
}
