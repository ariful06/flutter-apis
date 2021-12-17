import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_api_learning/utils/colors.dart';
import 'package:flutter_api_learning/utils/conf.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'controller/chat_controller.dart';

class ChatPage extends GetView<ChatController> {

   ChatPage({
    Key? key,
  }) : super(key: key);


  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      _setAttachmentUploading(true);
      final name = result.files.single.name;
      final filePath = result.files.single.path!;
      final file = File(filePath);

      try {
        final reference = FirebaseStorage.instance.ref(name);
        await reference.putFile(file);
        final uri = await reference.getDownloadURL();

        final message = types.PartialFile(
          mimeType: lookupMimeType(filePath),
          name: name,
          size: result.files.single.size,
          uri: uri,
        );

        FirebaseChatCore.instance.sendMessage(message, controller.room!.id);
        _setAttachmentUploading(false);
      } finally {
        _setAttachmentUploading(false);
      }
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      _setAttachmentUploading(true);
      final file = File(result.path);
      final size = file.lengthSync();
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final name = result.name;

      try {
        final reference = FirebaseStorage.instance.ref(name);
        await reference.putFile(file);
        final uri = await reference.getDownloadURL();

        final message = types.PartialImage(
          height: image.height.toDouble(),
          name: name,
          size: size,
          uri: uri,
          width: image.width.toDouble(),
        );

        FirebaseChatCore.instance.sendMessage(
          message,
          controller.room!.id,
        );
        _setAttachmentUploading(false);
      } finally {
        _setAttachmentUploading(false);
      }
    }
  }

  void _handleMessageTap(types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        final client = http.Client();
        final request = await client.get(Uri.parse(message.uri));
        final bytes = request.bodyBytes;
        final documentsDir = (await getApplicationDocumentsDirectory()).path;
        localPath = '$documentsDir/${message.name}';

        if (!File(localPath).existsSync()) {
          final file = File(localPath);
          await file.writeAsBytes(bytes);
        }
      }

      await OpenFile.open(localPath);
    }
  }

  void _handlePreviewDataFetched(types.TextMessage message,
      types.PreviewData previewData,) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, controller.room!.id);
  }

  void _handleSendPressed(types.PartialText message) {
    FirebaseChatCore.instance.sendMessage(
      message,
      controller.room!.id,
    );
  }

  void _setAttachmentUploading(bool uploading) {
    controller.isAttachmentUploading.value = uploading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<types.Room>(
        initialData: controller.room,
        stream: FirebaseChatCore.instance.room(controller.room!.id),
        builder: (context, snapshot) {
          return StreamBuilder<List<types.Message>>(
            initialData: const [],
            stream: FirebaseChatCore.instance.messages(snapshot.data!),
            builder: (context, snapshot) {
              return Container(
                color: kChatPageBg,
                child: Column(
                  children: [
                    Container(
                      height: 131.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 24.w, top: 66.h, right: 28.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: SizedBox(

                                      child: SvgPicture.asset(
                                        'assets/images/icon_back.svg',
                                      )),
                                ),
                                SizedBox(
                                  width: 35.w,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  width: 44.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.asset(
                                      'assets/images/elon.jpg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bill G.",
                                        style: FontStyles.p60018xfffffffff,
                                      ),
                                      Text("Today at 2:30 pm",
                                          style: FontStyles.p40012xfffffffff)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    // height: 24.h,
                                      width: 22.8.w,
                                      child: SvgPicture.asset(
                                        'assets/images/icon_phone.svg',
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Chat(
                          showUserAvatars: true,
                          theme: const DefaultChatTheme(
                              primaryColor: kButtonColor,
                              secondaryColor: Colors.white,
                              backgroundColor: kChatPageBg
                          ),
                          customBottomWidget: Container(
                            height: 31.h,
                            color: Colors.transparent,
                            margin: EdgeInsets.only(
                                left: 14.w, right: 18.w, bottom: 18.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _handleFileSelection();
                                  },
                                  child: Container(
                                    height: 33.h,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                        color: kChatIconBg),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            'assets/images/icon_camera.svg')),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 33.h,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                        color: kChatIconBg),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            'assets/images/icon_mic.svg')),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                        color: kChatIconBg),
                                    child: Center(
                                        child: TextFormField(
                                            controller: controller.textMessageController,
                                            decoration: InputDecoration(
                                                hintText: 'type here'.toUpperCase(),
                                                hintStyle: FontStyles.m40009xffbdbdbd,
                                                fillColor: kChatIconBg,
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.symmetric(
                                                    horizontal: 12.w, vertical: 12.h)),
                                            style: FontStyles.m40009xffbdbdbd)),
                                  ),
                                ),
                                SizedBox(
                                  width: 11.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    _handleSendPressed(types.PartialText(
                                        text: controller.textMessageController.text.trim()));
                                    controller.textMessageController.clear();
                                  },
                                  child: Container(
                                    height: 33.h,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                        color: kButtonColor),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            'assets/images/icon_send.svg')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isAttachmentUploading: controller.isAttachmentUploading.value,
                          messages: snapshot.data ?? [],
                          onAttachmentPressed: _handleAtachmentPressed,
                          onMessageTap: _handleMessageTap,
                          onPreviewDataFetched: _handlePreviewDataFetched,
                          onSendPressed: _handleSendPressed,
                          user: types.User(
                            id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

