extension ExtString on String {
  /*
(?!.* ) means: does not contain " "
(?=.*\d) means: contains at least one digit.
(?=.*[A-Z]) means: contains at least one capital letter
*/

  bool get isValidEmail {
    final emailRegExp = RegExp(
      //  r'^(([^<>()[\]\\. !^,#-;:\~s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      //  r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.([a-zA-Z]{2,5})$"
      //   r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+.com");
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');


    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
      //   r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
        r'^(?=.*?[a-z])(?!.* )(?=.*?[a-z])(?=.*?[0-9])(?=.*?[-_!@#$%^[&*()\&*~,.<>{};=+/]).{6,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp('[a-zA-Z]');
    // RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r'(^(?:[+0]1)?[0-9]{10,12}$)');
    return phoneRegExp.hasMatch(this);
  }
}
