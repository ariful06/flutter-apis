import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/controller/custom_better_player_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class BetterPlayerExample extends GetView<CustomBetterPlayerController> {
  const BetterPlayerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
        title: Text(controller.argumentData[0]['title'] ?? "No Title"),
    centerTitle: true,
    ),
    backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
    body: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer.network(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
      ),
      ),
    ));
  }
}
