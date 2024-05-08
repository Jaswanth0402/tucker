import 'package:flutter/material.dart';
import 'package:tucker/core/utils/validation.dart';

import '../constants/strings.dart';


// ignore: camel_case_extensions
extension keyboardType on String{
  TextInputType get getTextInput {
    switch (this) {
      
      case Strings.city:
        return TextInputType.text;
      case Strings.email:
        return TextInputType.emailAddress;
      case Strings.mobile:
        return TextInputType.phone;
      case Strings.address:
        return TextInputType.visiblePassword;
    }
    return TextInputType.text;
  }

  String? getValidation(String? type) {
    switch (this) {
      case Strings.address:
        return GeneralValidation.isValidElement(type);
      case Strings.email:
        return GeneralValidation.isValidEmailId(type);
      case Strings.mobile:
        return GeneralValidation.isValidElement(type);
      case Strings.city:
        return GeneralValidation.isValidPasswordString(type);
    }
    return null;
  }
}