class ValidationMixin {
  String? validateEmail(String? value) {
    if (!value!.contains('@')) {
      return 'Invalid Email!';
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 4) {
      return 'Invalid Password!';
    }
  }
}
