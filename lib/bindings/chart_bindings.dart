

import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/controller/chart_controller.dart';
import 'package:get/get.dart';

class ChartBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChartController());
  }
}
