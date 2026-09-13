class Validations {
  static bool emailValidator(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }
}
