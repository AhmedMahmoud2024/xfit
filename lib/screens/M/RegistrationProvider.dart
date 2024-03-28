import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  int _currentStep = 0;
  String _name = '';
  String _email = '';
  String _password = '';
  String _phone = '';
  List<String> _fields5 = List.filled(5, '');
  List<String> _dropdownValues = List.filled(10, '');

  int get currentStep => _currentStep;

  String get name => _name;

  String get email => _email;

  String get password => _password;

  String get phone => _phone;

  List<String> get fields5 => _fields5;

  List<String> get dropdownValues => _dropdownValues;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void setFields5(int index, String value) {
    _fields5[index] = value;
    notifyListeners();
  }

  void setDropdownValue(int index, String value) {
    _dropdownValues[index] = value;
    notifyListeners();
  }

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void register() {
    // Perform registration logic here
    print('Name: $_name, Email: $_email, Password: $_password, Phone: $_phone');
    print('Fields5: $_fields5');
    print('DropdownValues: $_dropdownValues');
  }
}
