part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginValidate extends LoginState {
  final bool isValidate;

  LoginValidate(this.isValidate);
}

class LoginLoading extends LoginState {
  final bool isLoading;
  const LoginLoading(this.isLoading);
}

class LoggedIn extends LoginState {
  final bool response;
  const LoggedIn(this.response);
}

class LoginError extends LoginState {
  final bool response;
  const LoginError(this.response);
}
