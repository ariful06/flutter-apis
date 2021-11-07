

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CurvedBottomNavigationBarController extends SuperController<dynamic> {
  CurvedBottomNavigationBarController();

  dynamic argumentData = Get.arguments;
  @override
  void onInit() {
    print(argumentData[0]['title']);
    super.onInit();
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
