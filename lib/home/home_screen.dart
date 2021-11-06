import 'package:flutter/material.dart';
import 'package:flutter_api_learning/common/row_item.dart';
import 'package:flutter_api_learning/routes/app_routes.dart';
import 'package:get/get.dart';

class FlutterApiListScreen extends GetView {
  const FlutterApiListScreen({Key? key}) : super(key: key);

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
              title: CustomItem(title: "animation_do"),
              onTap: () => {Get.toNamed(AppRoutes.ANIMATION_DO,arguments: [
               {"title" : 'Animated Do Example'}
              ])},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "animations"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "badges"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "better_player"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "bot_toast"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "convex_bottom_bar"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "fl_chart"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "timeago"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "smooth_star_rating"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "settings_ui"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "pull_to_refresh "),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "introduction_screen "),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "hive_flutter "),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "flutter_slidable "),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "fl_chart  "),
              onTap: () => {},
            ),
          ],
        ));
  }
}
