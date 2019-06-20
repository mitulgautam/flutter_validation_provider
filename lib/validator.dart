class Validator {
  static String validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)
        ? null
        : 'Enter valid email.';
  }

  static String validateName(String name) {
    return name.length > 2 ? null : 'Name must contains aleast 3 characters.';
  }

  static String validatePassword(String password) {
    return password.length > 5
        ? null
        : 'Password must be greater than 6 characters.';
  }

  static String confirmPassword(String password, String confirmPassword) {
    return password == confirmPassword && confirmPassword.length > 5
        ? null
        : 'Password does not match! Re-enter.';
  }
}
