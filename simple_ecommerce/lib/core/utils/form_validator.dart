import 'package:flutter/material.dart';

enum TextType { none, email, password }

class CustomFormValidator {
  CustomFormValidator({required this.type, required this.context});
  TextType type;
  BuildContext context;

  String? Function(String?) validate() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      switch (type) {
        case TextType.email:
          if (!value.contains('@')) {
            return 'Email format wrong';
          }
          break;
        case TextType.password:
          if (value.length < 8) {
            return 'Password must be at least 8 charachter';
          }
          break;
        default:
          return null;
      }
    };
  }
}
