

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/controller/custom_better_player_controller.dart';
import 'package:get/get.dart';

class BetterPlayerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomBetterPlayerController());
  }
}
