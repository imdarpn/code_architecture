import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_structure/api_service/dio_client.dart';
import 'package:getx_structure/common/constants/color_constants.dart';
import 'package:getx_structure/common/constants/font_constants.dart';
import 'package:getx_structure/pages/splash/splash_bindings.dart';

import 'notification_handler/my_notification_manager.dart';
import 'routes/app_pages.dart';
import 'utils/logger_util.dart';

void main(main){
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
  configLoading();
}

initServices() async {
  /*FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  MyNotificationManager().init();*/
  await Get.putAsync<DioClient>(() => DioClient().init());
}

Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  logger.log('Handling a background message ${message.messageId}');
  // handleNotification(message);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorConstants.blackColor,
      systemNavigationBarDividerColor: ColorConstants.greyBackground,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return  GetMaterialApp(



      theme: ThemeData(
        textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeightConstants.regular,
            )

        ),
        primaryColor: ColorConstants.selectedLightGreen,
        colorScheme: const ColorScheme.highContrastLight(
            primary: ColorConstants.selectedLightGreen
        ),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        focusColor: ColorConstants.whiteColor,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      initialBinding: SplashBindings(),
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.routes,
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ColorConstants.whiteColor
    ..backgroundColor = ColorConstants.selectedLightGreen
    ..indicatorColor = ColorConstants.whiteColor
    ..textColor = ColorConstants.whiteColor
    ..maskColor = Colors.deepOrange.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = true;
}