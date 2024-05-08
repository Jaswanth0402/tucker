class GeneralValidation{

  static String? isValidElement(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required';
    }
    return null;
  }

  static String? isValidEmailId(String? value) {
    if (value == null || value.isEmpty) {
      // print('if $value');
      return 'Field required';
    } else if (!isValidEmail(value)) {
      // print('else');
      return 'Requires valid email address';
    }
    return null;
  }
  static String? isValidPasswordString(String? value) {
    if (value == null || value.isEmpty) {
      // print('if $value');
      return 'Field required';
    } else if (!isValidPassword(value)) {
      // print('else');
      return 'Requires valid Password';
    }
    return null;
  }
}


bool isValidEmail(String? email) {
  return RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  ).hasMatch(email!);


}
bool isValidPassword(String? password) {
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password!);

}
  