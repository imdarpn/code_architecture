part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;

  const factory LoginEvent.emailChanged(String emailString) = _EmailChanged;

  const factory LoginEvent.passwordChanged(String passwordString) =
  _PasswordChanged;

  const factory LoginEvent.obscurePasswordToggled() =
  _ObscurePasswordToggled;

  const factory LoginEvent.loginSubmitted() = _LoginSubmitted;
}
