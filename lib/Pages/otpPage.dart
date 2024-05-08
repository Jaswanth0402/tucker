// ignore: file_names
import 'package:flutter/material.dart';
import 'package:tucker/Views/otpView.dart';

// ignore: must_be_immutable
class OtpPage extends StatefulWidget {
 String phNumber;
 OtpPage( {super.key,required this.phNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? verificationId;

  @override
  Widget build(BuildContext context) {
    return  OtpView(phNumber: widget.phNumber);
  }
}