String password;

class ValidationService {
  String emailValidator(String value) {
    if (value.isEmpty) {
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

  String passwordValidator(String value) {
    if (value == null) {
      return 'Please enter a valid password';
    }

    if (value.length < 8) {
      print('pass');
      return 'Please enter a password with more than 8 characters';
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

  String IDValidator(String value) {
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

  String licenseValidator(String value) {
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

  String contactValidator(String value) {
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

  String nameValidator(String value) {
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
