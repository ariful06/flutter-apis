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
              title: CustomItem(title: "Chat Ui"),
              onTap: () => {Get.toNamed(AppRoutes.FLAYER_CHAT,arguments: [
                {"title" : 'Chat UI'}
              ])},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "Google Map"),
              onTap: () => {Get.toNamed(AppRoutes.GOOGLE_MAP,arguments: [
                {"title" : 'Google Map'}
              ])},
            ),
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
              title: CustomItem(title: "bottom Navigatoin curved"),
              onTap: () => {
                Get.toNamed(AppRoutes.CURVED_BOTTOM_NAVIGATION,arguments: [{"title" : 'Curved bottom navigation'}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "badges"),
              onTap: () => {
                Get.toNamed( AppRoutes.BADGES,arguments: [{"title" : 'Badges'}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "better_player"),
              onTap: () => {
                Get.toNamed( AppRoutes.BETTER_PLAYER,arguments: [{"title" : 'Better player'}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "bot_toast"),
              onTap: () => {
                Get.toNamed(AppRoutes.BOT_TOAST,arguments: [{'title':'Bot Toast'}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "convex_bottom_bar"),
              onTap: () => {},
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "fl_chart"),
              onTap: () => {
                Get.toNamed(AppRoutes.FL_CHART,arguments: [{'title':'Chart'}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "timeago"),
              onTap: () => {
                Get.toNamed(AppRoutes.TIME_AGO,arguments: [{'title':'Times ago '}])
              },
            ),
            ListTile(
              leading: FlutterLogo(),
              title: CustomItem(title: "smooth_star_rating"),
              onTap: () => {
                Get.toNamed(AppRoutes.SMOOTH_STAR,arguments: [{'title':'Smooth  start'}])
              },
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
