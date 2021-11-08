import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartController extends SuperController<dynamic> {
  ChartController();

  var currentPage = 0.obs;
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
