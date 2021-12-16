
import 'package:flutter_api_learning/bindings/animation_bindings.dart';
import 'package:flutter_api_learning/bindings/badges_bindings.dart';
import 'package:flutter_api_learning/bindings/better_player_bindings.dart';
import 'package:flutter_api_learning/bindings/chart_bindings.dart';
import 'package:flutter_api_learning/bindings/chat_ui_bindings.dart';
import 'package:flutter_api_learning/bindings/curved_bottom_navigation_bindings.dart';
import 'package:flutter_api_learning/bindings/smooth_star_bindings.dart';
import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/home/animation/animation_do.dart';
import 'package:flutter_api_learning/home/badges/badges_page.dart';
import 'package:flutter_api_learning/home/better_player/better_player_page.dart';
import 'package:flutter_api_learning/home/bottom_navigation/floating_action_button_bottom_navigation_bar.dart';
import 'package:flutter_api_learning/home/chart/chart_page.dart';
import 'package:flutter_api_learning/home/chat/chat_page.dart';
import 'package:flutter_api_learning/home/chat/login/bindings/login_bindings.dart';
import 'package:flutter_api_learning/home/chat/login/login_page.dart';
import 'package:flutter_api_learning/home/home_screen.dart';
import 'package:flutter_api_learning/home/smootstart/smooth_star_example.dart';
import 'package:flutter_api_learning/home/timesago/times_ago_example.dart';
import 'package:flutter_api_learning/home/toast/toast_example.dart';
import 'package:flutter_api_learning/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<FlutterApiListScreen>(name: AppRoutes.START, page: ()=> const FlutterApiListScreen()),
    GetPage<LoginPage>(name: AppRoutes.FLAYER_CHAT, page: ()=> LoginPage(),transition: Transition.fadeIn,binding: LoginBindings()),
    GetPage<AnimationDoSample>(name: AppRoutes.ANIMATION_DO, page: ()=> AnimationDoSample(),transition: Transition.fadeIn,binding: AnimationBindings()),
    GetPage<CurvedBottomNavigationBarPage>(name: AppRoutes.CURVED_BOTTOM_NAVIGATION, page: ()=> CurvedBottomNavigationBarPage(),transition: Transition.fadeIn,binding: CurvedBottomNavigationBarBindings()),
    GetPage<BadgesExample>(name: AppRoutes.BADGES, page: ()=> BadgesExample(),transition: Transition.fadeIn,binding: BadgesBindings()),
    GetPage<BetterPlayerExample>(name: AppRoutes.BETTER_PLAYER, page: ()=> BetterPlayerExample(),transition: Transition.fadeIn,binding: BetterPlayerBindings()),
    GetPage<BotToastExample>(name: AppRoutes.BOT_TOAST, page: ()=> BotToastExample(),transition: Transition.fadeIn),
    GetPage<ChartPage>(name: AppRoutes.FL_CHART, page: ()=> ChartPage(),transition: Transition.fadeIn,binding: ChartBindings()),
    GetPage<TimesAgoExample>(name: AppRoutes.TIME_AGO, page: ()=> TimesAgoExample(),transition: Transition.fadeIn,),
    GetPage<SmoothStarExample>(name: AppRoutes.SMOOTH_STAR, page: ()=> SmoothStarExample(),transition: Transition.fadeIn,binding: SmoothStarBindings())
  ];
}