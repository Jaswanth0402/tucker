import 'package:flutter/material.dart';
import 'package:tucker/Widget/RegisterWidget.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
   String phnumber;
   RegisterView({super.key,required this.phnumber});

  @override
  Widget build(BuildContext context) {
    return  RegisterWidget(phnumber:phnumber);
  }
}