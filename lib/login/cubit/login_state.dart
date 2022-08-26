part of 'login_cubit.dart';

class LoginState {
  final bool response;
  final bool isLoading;
  const LoginState({required this.isLoading, required this.response});

  LoginState copyWith({bool? response, bool? isLoading}) {
    return LoginState(
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading);
  }

  List<Object?> get props => [response, isLoading];
}
