import 'package:equatable/equatable.dart';

import '../../../domain/login/entity/login_entity.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginStateInit implements LoginState{
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class LoginStateLoading implements LoginState {
  final bool isLoading;

  LoginStateLoading({required this.isLoading});

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;
}

class LoginStateSuccessLogin implements LoginState {
  final LoginEntity loginEntity;

  LoginStateSuccessLogin({required this.loginEntity});

  @override
  List<Object?> get props => [loginEntity];

  @override
  bool? get stringify => false;
}

class LoginStateErrorLogin implements LoginState {
  final String message;

  LoginStateErrorLogin({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => false;
}






