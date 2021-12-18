

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/home/chat/controller/chat_controller.dart';
import 'package:flutter_api_learning/home/map/controller/map_controller.dart';
import 'package:get/get.dart';

class MapBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapController());
  }
}
