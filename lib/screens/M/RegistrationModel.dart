import 'package:flutter/foundation.dart';

class RegistrationModel {
  String name;
  String email;
  String password;
  String phone;
  List<String> fields5;
  List<String> dropdownValues;

  RegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.fields5,
    required this.dropdownValues,
  });
}