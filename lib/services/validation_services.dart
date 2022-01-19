String ? password ;
class Errors {
  static String show(String errorCode) {
    switch (errorCode) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return "This e-mail address is already in use, please use a different e-mail address.";

      case 'ERROR_INVALID_EMAIL':
        return "The email address is badly formatted.";

      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return "The e-mail address in your Facebook account has been registered in the system before. Please login by trying other methods with this e-mail address.";

      case 'ERROR_WRONG_PASSWORD':
        return "E-mail address or password is incorrect.";

      default:
        return "An error has occurred";
    }
  }
}
// @dart=2.9
class ValidationService {
  String? emailValidator(String value) {
    if (value.isEmpty || value == null) {
      return 'Please enter a valid email';
    }

    String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      // print('here');
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value == null) {
      return 'Please enter a valid password';
    }

    if (value.length < 6) {
      print('pass');
      return ' Password should be at least 6 characters ';
    }

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid password';
    }

    password = value;
    return null;
  }

  String? IDValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid ID number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp = new RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid ID number';
    }

    return null;
  }

  String? licenseValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid License Number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid License Number';
    }

    return null;
  }

  String? contactValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid phone number';
    }

    if (value.length != 10) {
      return 'Please enter a valid phone number';
    }

    String pattern = r'^[0-9]*$';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? nameValidator(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid name';
    }

    String pattern = r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$";
    RegExp regExp =  RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }

    return null;
  }

}
