import 'package:flutter/cupertino.dart';

class LoginSignUpProvider extends ChangeNotifier {
  bool _correctEmail = false;
  bool _secureTextPass = true;
  bool _secureTextConfPass = true;
  bool _checkboxValue = false;
  String _registeredEmail = '';
  String _registeredPassword = '';
  bool _checkedAgreement = false;

  final _formKey = GlobalKey<FormState>();

  bool checkFieldValidation() {
    return _formKey.currentState!.validate();
  }

  bool checkInformation(String email, String password) {
    return email == _registeredEmail;
        // && password == _registeredPassword;
  }

  bool checkEmailValidation(String value) {
    _correctEmail =
        (value.contains('@gmail.com') || value.contains('@yahoo.com'))
            ? true
            : false;

    notifyListeners();
    return _correctEmail;
  }

  bool checkPasswordFormat(String inputValue) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(inputValue);
  }

  bool checkConfirmPass(String? firstInput, String secondInput) {
    bool samePass = firstInput == secondInput && firstInput!.isNotEmpty;
    _registeredPassword = (samePass ? firstInput : '');
    return samePass;
  }

  void showHidePass() {
    _secureTextPass = _secureTextPass ? false : true;
    notifyListeners();
  }

  void showHideConfPass() {
    _secureTextConfPass = _secureTextConfPass ? false : true;
    notifyListeners();
  }



  bool checkAgreement(bool value){
    _checkedAgreement = value;
    notifyListeners();
    return _checkedAgreement;
  }



  ////// getters and setters
  GlobalKey<FormState> get formKey => _formKey;

  String get registeredEmail => _registeredEmail;


  bool get checked => _checkedAgreement;

  set checked(bool value) {
    _checkedAgreement = value;
  }

  set registeredEmail(String value) {
    _registeredEmail = value;
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

  String get registeredPassword => _registeredPassword;

  set registeredPassword(String value) {
    _registeredPassword = value;
  }
}
