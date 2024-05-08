import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tucker/Pages/registerPage.dart';
import 'package:tucker/Widget/component/button.dart';
import 'package:tucker/core/utils/colors.dart';

class OtpWidget extends StatefulWidget {
  String phNumber;
  OtpWidget({super.key, required this.phNumber});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  String? pin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60.0,
                        ),
                        const Image(
                          image: AssetImage("assets/images/TUCKER LOGO-1.png"),
                          width: 150,
                        ),
                        const SizedBox(
                          height: 55.0,
                        ),
                        const Text(
                          "VERIFICATION",
                          style: TextStyle(color: Colors.red, fontSize: 22.0),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Enter OTP code sent to your number",
                          style: TextStyle(color: Colors.red, fontSize: 15.0),
                        ),
                        const SizedBox(
                          height: 35.0,
                        ),
                        Container(
                          height: 20,
                          child: OtpTextField(
                            numberOfFields: 6,
                            borderColor: lightBlack,
                            disabledBorderColor: lightBlack,
                            enabledBorderColor: lightBlack,
                            focusedBorderColor: primaryColor,
                            showFieldAsBox: false,
                            borderWidth: 4.0,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here if necessary
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              print(verificationCode);
                              pin =verificationCode;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonWidget(
                      value: "Verify",
                      onpressed: () {
                        if(pin=='123456'){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  RegisterPage(phnumber: widget.phNumber,)));
                        }
                        else{
                           const snackdemo = SnackBar(
                              content: Text('Incorrect OTP Please check'),
                              backgroundColor: Colors.black,
                              elevation: 60,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(55),
                              duration: Duration(seconds: 1),
                              animation: kAlwaysDismissedAnimation,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackdemo);
                        }
                      }),
                  ButtonWidget(value: "Resend", onpressed: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
