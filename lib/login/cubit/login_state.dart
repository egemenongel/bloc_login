part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoggedIn extends LoginState {
  final bool response;
  const LoggedIn(this.response);
}

class LoginError extends LoginState {
  const LoginError();
}
