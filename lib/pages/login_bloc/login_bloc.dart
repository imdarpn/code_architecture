import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:getx_structure/repository/auth_repository.dart';
import 'package:getx_structure/utils/logger_util.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _authRepository = GetIt.instance.get<AuthRepository>();

  LoginBloc() : super(LoginState.initial()) {
    on<LoginEvent>(
          (event, emit) async {
        await event.when<FutureOr<void>>(
          emailChanged: (emailString) => _onEmailChanged(emit, emailString),
          passwordChanged: (passwordString) =>
              _onPasswordChanged(emit, passwordString),
          obscurePasswordToggled: () => _onObscurePasswordToggled(emit),
          loginSubmitted: () => _onLoginSubmitted(emit), started: () {  },
        );
      },
    );
  }

  void _onEmailChanged(Emitter<LoginState> emit, String emailString) {
    emit(
      state.copyWith(
        emailAddress: emailString,
        authFailureOrSuccess: null,
      ),
    );
  }

  void _onPasswordChanged(Emitter<LoginState> emit, String passwordString) {
    emit(
      state.copyWith(
        password: passwordString,
        authFailureOrSuccess: null,
      ),
    );
  }

  void _onObscurePasswordToggled(Emitter<LoginState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onLoginSubmitted(Emitter<LoginState> emit) async {
    final isEmailValid = state.emailAddress.isNotEmpty;
   final isPasswordValid = state.password.isNotEmpty;

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: null,
        ),
      );
      logger.e("MESSGE !!!---");

       _authRepository.doLogin(emailId: state.emailAddress,password: state.password);

      // Perform network request to get a token.

      await Future.delayed(const Duration(seconds: 1));
    }
    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessage: true,

        // Depending on the response received from the server after loggin in,
        // emit proper authFailureOrSuccess.

        // For now we will just see if the email and password were valid or not
        // and accordingly set authFailureOrSuccess' value.

        authFailureOrSuccess:
        (isEmailValid && isPasswordValid) ? right(unit) : null,
      ),
    );
  }
}