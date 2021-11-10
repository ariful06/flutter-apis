

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/controller/aimation/curved_bottom_navigation_bar_controller.dart';
import 'package:flutter_api_learning/controller/badges_controller.dart';
import 'package:get/get.dart';

class BadgesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BadgesController());
  }
}
