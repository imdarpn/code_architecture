import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:getx_structure/data/login/login/remote/dto/login_request.dart';
import 'package:getx_structure/utils/logger_util.dart';
import 'package:meta/meta.dart';

import '../../../domain/login/usecase/login_usecase.dart';
import '../../common/enums/loading_status.dart';
import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase? loginUseCase;


  LoginBloc({this.loginUseCase}) : super( LoginStateInit()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);

  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
      LoginButtonPressedEvent event,
      Emitter<LoginState> emit,
      ) async {
    try {
      EasyLoading.show();
      LoginRequest loginRequest = LoginRequest(email: "darpan@gmail.com", password: "123456");
      logger.e("LOGIN REQUEST === $loginRequest");
      logger.e("LOGIN USECASE === $loginUseCase");
      var result = await loginUseCase!.login(loginRequest);
      logger.e("RESULT== $result");
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();

      //logger.e(e.toString());
    }
  }

}