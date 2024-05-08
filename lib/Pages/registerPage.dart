import 'package:flutter/material.dart';
import 'package:tucker/Views/RegisterView.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  String phnumber;
 RegisterPage({super.key,required this.phnumber});

  @override
  Widget build(BuildContext context) {
    return  RegisterView(phnumber: phnumber,);
  }
}