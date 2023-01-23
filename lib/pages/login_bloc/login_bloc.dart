import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_structure/repository/auth_repository.dart';
import 'package:meta/meta.dart';

import '../../common/enums/loading_status.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _authRepository = GetIt.instance.get<AuthRepository>();


  LoginBloc() : super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
    on<LoginEmailChangedEvent>(_handleLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_handleLoginPasswordChangedEvent);
  }

  Future<void> _handleLoginEmailChangedEvent(
      LoginEmailChangedEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleLoginPasswordChangedEvent(
      LoginPasswordChangedEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
      LoginButtonPressedEvent event,
      Emitter<LoginState> emit,
      ) async {
    try {
      EasyLoading.show();
      var commonResponse=  await _authRepository.doLogin(
        emailId: state.email,
        password: state.password,
      );
      EasyLoading.dismiss();
      if (commonResponse.message != null && commonResponse.status) {
        emit(state.copyWith(message: commonResponse.message, status: LoadStatus.success));
      } else {
        emit(state.copyWith(message: commonResponse.message, status: LoadStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoadStatus.failure));
    }
  }

}
