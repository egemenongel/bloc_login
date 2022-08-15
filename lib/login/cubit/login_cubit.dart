import 'package:bloc_login/login/service/login_service.dart';
import 'package:bloc_login/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService _loginService;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  LoginCubit(this._loginService, this.emailController, this.passwordController)
      : super(const LoginInitial());

  Future<bool> loginWithEmail() async {
    emit(const LoginLoading());
    var response = await _loginService
        .logIn(User(emailController.text, passwordController.text));
    emit(LoggedIn(response));
    return response;
  }
}
