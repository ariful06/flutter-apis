

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:get/get.dart';

class AnimationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationDoController());
  }
}
