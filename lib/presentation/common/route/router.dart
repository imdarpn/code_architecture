import 'package:flutter/material.dart';
import 'package:getx_structure/presentation/login/bloc/login_state.dart';

import '../../../main.dart';
import '../../login/bloc/login_page.dart';
import '../../login/login_screen.dart';
import '../../splash/splash.page.dart';

class AppRouter {
  static const ROUTE_SPLASH = "/splash";
  static const ROUTE_LOGIN = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_SPLASH:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case ROUTE_LOGIN:
        return MaterialPageRoute(builder: (_) => LoginView(loginBloc: sl.get()));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text("No route"))));
    }
  }
}