import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_learning/routes/app_routes.dart';
import 'package:flutter_api_learning/routes/app_pages.dart';
import 'package:flutter_api_learning/utils/getx_service.dart';
import 'package:flutter_api_learning/utils/getx_translations.dart';
import 'package:flutter_api_learning/utils/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get_storage/get_storage.dart';

class FlutterApiListPage extends StatefulWidget {
  final String? title;
  const FlutterApiListPage({Key? key, this.title}) : super(key: key);

  @override
  _FlutterApiListPageState createState() => _FlutterApiListPageState();
}

class _FlutterApiListPageState extends State<FlutterApiListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FadeInLeft(child: Square() ),
            FadeInUp(child: Square() ),
            FadeInDown(child: Square() ),
            FadeInRight(child: Square() ),
          ],
        ),
      ),
    );
  }
}
class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 24,
      width: 24,
    );
  }
}

Future<void> initServices() async {
  debugPrint('Starting GetX Services...');
  await Firebase.initializeApp();
  await GetStorage.init();
  await Get.putAsync(() => GlobalVariablesService().init());
  debugPrint('All GetX Services Started...');
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    DevicePreview(builder: (BuildContext context)=> const FlutterApiApp())
  );
}

class FlutterApiApp extends StatelessWidget {
  const FlutterApiApp({Key? key}) : super(key: key);

  static GlobalKey flutterApiKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(410,840),
      builder: (){
        return GetMaterialApp(
          key: flutterApiKey,
          builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
          title: "Flutter Api Example",
          translations: GetTranslations(),
          locale: Get.deviceLocale,
          fallbackLocale: GetTranslations.fallbackLocal,
          theme: Style.lightTheme,
          darkTheme: Style.darkTheme,
          themeMode: ThemeMode.light,
          defaultTransition: Transition.fadeIn,
          getPages: AppPages.routes,
          initialRoute: AppRoutes.START,
          enableLog: true,
          logWriterCallback: (String text, {bool isError = false}){
            debugPrint("LearningLog: $text");
          },
          navigatorObservers: <NavigatorObserver>[
            GetObserver(),
            BotToastNavigatorObserver()
          ],

        );
      },
    );
  }
}






