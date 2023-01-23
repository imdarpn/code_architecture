part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('')String emailAddress,
    @Default('')String password,
    @Default(false) bool isSubmitting,
    @Default(false) bool showErrorMessage,
    @Default(true) bool obscurePassword,
    Either<bool, Unit>? authFailureOrSuccess,
    // Unit comes from Dartz package and is equivalent to void.
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
    emailAddress: '',
    password: ''
  );
}