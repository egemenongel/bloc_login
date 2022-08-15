import 'package:bloc_login/home/home_view.dart';
import 'package:bloc_login/login/cubit/login_cubit.dart';
import 'package:bloc_login/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        LoginService(),
        TextEditingController(),
        TextEditingController(),
      ),
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial || state is LoggedIn) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller:
                              context.read<LoginCubit>().emailController),
                      TextFormField(
                          controller:
                              context.read<LoginCubit>().passwordController),
                      ElevatedButton(
                        onPressed: () async {
                          bool response =
                              await context.read<LoginCubit>().loginWithEmail();
                          response == true
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()))
                              : null;
                        },
                        child: const Text('LOGIN'),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(
                child: Text('ERROR'),
              );
            }
          },
        ),
      ),
    );
  }
}
