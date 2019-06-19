class User {
  String _name, _email, _password, _confirmPassword;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get email => _email;

  get confirmPassword => _confirmPassword;

  set confirmPassword(value) {
    _confirmPassword = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }
}
