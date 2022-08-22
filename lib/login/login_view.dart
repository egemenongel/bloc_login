import 'package:bloc_login/login/cubit/login_cubit.dart';
import 'package:bloc_login/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        context,
        LoginService(),
        formKey,
        emailController,
        passwordController,
      ),
      child: Scaffold(
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Center(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildEmailField(context),
                            const SizedBox(
                              height: 20,
                            ),
                            _buildPasswordField(context),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildLoginButton(context),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  ElevatedButton _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await context.read<LoginCubit>().loginWithEmail();
      },
      child: const Text('LOGIN'),
    );
  }

  TextFormField _buildEmailField(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().emailController,
      validator: (val) => val!.isEmpty ? 'Please fill this field' : null,
      decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }

  TextFormField _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().passwordController,
      validator: (val) => val!.isEmpty ? 'Please fill this field' : null,
      decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
