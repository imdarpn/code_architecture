part of 'app_pages.dart';

abstract class Routes {
  static const splash = _Paths.splash;
  static const login = _Paths.login;
  static const forgotPassword = _Paths.forgotPassword;
  static const signup = _Paths.signup;



}

abstract class _Paths {
  static const splash = '/splash';
  static const login = '/login';
  static const forgotPassword = '/forgotPassword';
  static const signup = '/signup';

}
