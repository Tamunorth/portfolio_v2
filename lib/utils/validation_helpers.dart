class FieldValidators {
  ///Validator functions not available outside the validator so this has been paused
  ///
  ///
  static String? notEmptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please complete this field';
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please complete this field';
    } else if (!value.isEmail) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }
}

extension AppExtensions on String {
  bool get isEmail => ValidationFunctions.isEmail(this);
}

class ValidationFunctions {
  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isEmail(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}
