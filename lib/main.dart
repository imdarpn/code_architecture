import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_structure/api_service/dio_client.dart';
import 'package:getx_structure/common/constants/color_constants.dart';
import 'package:getx_structure/common/constants/font_constants.dart';
import 'package:getx_structure/pages/login_bloc/login_bloc.dart';
import 'package:getx_structure/pages/login_bloc/login_screen.dart';
import 'package:getx_structure/repository/auth_repository.dart';

import 'utils/logger_util.dart';
import 'utils/repository_manager.dart';

void main(main) {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
  configLoading();
}

initServices() async {
  /*FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  MyNotificationManager().init();*/
  //await Get.putAsync<DioClient>(() => DioClient().init());
  //Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());

  setup();
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
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginView(),
        builder: EasyLoading.init(),
      ),
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