
import 'package:flutter_api_learning/bindings/animation_bindings.dart';
import 'package:flutter_api_learning/controller/aimation/animation_do_controller.dart';
import 'package:flutter_api_learning/home/animation/animation_do.dart';
import 'package:flutter_api_learning/home/home_screen.dart';
import 'package:flutter_api_learning/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages{
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<FlutterApiListScreen>(name: AppRoutes.START, page: ()=> const FlutterApiListScreen()),
    GetPage<FlutterApiListScreen>(name: AppRoutes.ANIMATION_DO, page: ()=> AnimationDoSample(),transition: Transition.fadeIn,binding: AnimationBindings()),
  ];
}