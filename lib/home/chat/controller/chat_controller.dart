

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
class ChatController extends SuperController<dynamic> {
  ChatController();

  TextEditingController textMessageController = TextEditingController(text: '');
  RxBool isAttachmentUploading = false.obs;

  types.Room? room;
  void clearTextMessage(){
    textMessageController.clear();
  }
  dynamic argumentData = Get.arguments;
  @override
  void onInit() {

    room = argumentData[0]['room'];
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
