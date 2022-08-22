import 'package:bloc_login/home/home_view.dart';
import 'package:bloc_login/login/service/login_service.dart';
import 'package:bloc_login/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final BuildContext context;
  final LoginService _loginService;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  bool isLoginValidate = false;
  bool isLoading = false;
  LoginCubit(this.context, this._loginService, this.formKey,
      this.emailController, this.passwordController)
      : super(const LoginInitial());

  Future<bool> loginWithEmail() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoginValidate = true;
      emit(LoginValidate(isLoginValidate));
      changeLoading();
      var response = await _loginService
          .logIn(User(emailController.text, passwordController.text));
      changeLoading();
      if (response == true) {
        emit(LoggedIn(response));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomeView()));
      } else {
        emit(LoginError(response));
      }
      return response;
    }
    return false;
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoading(isLoading));
  }
}
