import 'package:flutter/material.dart';
import 'package:tucker/Widget/OtpWidget.dart';

// ignore: must_be_immutable
class OtpView extends StatelessWidget {
  String phNumber;
   OtpView({super.key,required  this.phNumber});

  @override
  Widget build(BuildContext context) {
    return OtpWidget(phNumber: phNumber,);
  }
}