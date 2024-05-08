import 'package:flutter/material.dart';
import 'package:tucker/Widget/component/button.dart';
import '../Pages/otpPage.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController phNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/Designer.png")),
                const SizedBox(
                  height: 6.0,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                        "Easy,fast and convenient way to track nearby EV charging stations and efficient charging",
                        style: TextStyle(fontSize: 15.0)),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: phNumber,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Enter your Mobile No",
                    hintStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.red),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                        value: "Login",
                        onpressed: () {
                          if (phNumber.text.isEmpty) {
                            const snackdemo = SnackBar(
                              content: Text('Please enter Mobile number'),
                              backgroundColor: Colors.black,
                              elevation: 60,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(55),
                              duration: Duration(seconds: 1),
                              animation: kAlwaysDismissedAnimation,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackdemo);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpPage(phNumber: phNumber.text)));
                          }
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
