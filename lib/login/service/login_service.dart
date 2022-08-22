import 'package:bloc_login/model/user.dart';

class LoginService {
  Future logIn(User user) async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await Future.value(true);
    return response;
  }
}
