import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_validation_provider/user_model.dart';
import 'package:flutter_validation_provider/validator.dart';

class SignUpModel with ChangeNotifier {
  bool _autoValidate = false;

  bool get autoValidate => _autoValidate;

  set autoValidate(bool value) {
    _autoValidate = value;
    notifyListeners();
    print('autovalidate $value');
  }

  User _user = User();

  User get user => _user;

  set user(User value) {
    _user = value;
    notifyListeners();
  }

  bool validate(GlobalKey<FormState> _form) {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      return true;
    }
    return false;
  }

  String validateName(String name) {
    return Validator.validateName(name);
  }

  String validatePassword(String password) {
    return Validator.validatePassword(password);
  }

  String validateEmail(String email) {
    return Validator.validateEmail(email);
  }

  String validateConfirmPassword(String password, String confirmPassword) {
    return Validator.confirmPassword(password, confirmPassword);
  }
}
