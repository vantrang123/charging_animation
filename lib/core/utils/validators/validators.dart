import 'package:injectable/injectable.dart';

@lazySingleton
class AppValidators {
  // validate password
  bool _isStrongPassword(String password) {
    return RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{6,}$')
        .hasMatch(password);
  }

  String? validatePassword(String password) {
    return _isStrongPassword(password) ? null : 'Password is not strong enough';
  }

  // validate email
  bool _isEmail(String text) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(text);
  }

  String? validateEmail(String email) {
    return _isEmail(email) ? null : 'Email is not valid';
  }
}
