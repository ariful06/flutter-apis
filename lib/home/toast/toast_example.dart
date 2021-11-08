import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/common/row_item.dart';
import 'package:get/get.dart';

class BotToastExample extends GetView {
  const BotToastExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Api Learning"),
          centerTitle: true,
        ),
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "Normal Toast"),
              onTap:() => {
                BotToast.showText(text: "Normal Toast")
            },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "animations"),
              onTap: () => {
                BotToast.showSimpleNotification(title: "Notification")
                //clo
              },
            ),
          ],
        ));
  }
}
