

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/controller/smooth_start_controller.dart';
import 'package:get/get.dart';

class SmoothStarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmoothStartController());
  }
}
