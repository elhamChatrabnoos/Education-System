import 'package:flutter/cupertino.dart';

class LoginSignUpProvider extends ChangeNotifier {
  bool _correctEmail = false;
  bool _secureTextPass = true;
  bool _secureTextConfPass = true;
  bool _checkboxValue = false;

  void checkEmailValidation(String value) {
    _correctEmail =
        (value.contains('@gmail.com') || value.contains('@yahoo.com'))
            ? true
            : false;
    notifyListeners();
  }

  void showHidePass() {
    _secureTextPass = _secureTextPass ? false : true;
    notifyListeners();
  }

  void showHideConfPass() {
    _secureTextConfPass = _secureTextConfPass ? false : true;
    notifyListeners();
  }

  bool get correctEmail => _correctEmail;
  set correctEmail(bool value) {
    _correctEmail = value;
  }

  bool get secureTextPass => _secureTextPass;
  set secureTextPass(bool value) {
    _secureTextPass = value;
  }

  bool get secureTextConfPass => _secureTextConfPass;
  set secureTextConfPass(bool value) {
    _secureTextConfPass = value;
  }

  bool get checkboxValue => _checkboxValue;
  set checkboxValue(bool value) {
    _checkboxValue = value;
  }

}
