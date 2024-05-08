import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:tucker/Widget/component/button.dart';


class QrscanWidget extends StatefulWidget {

 QrscanWidget({super.key});

  @override
  State<QrscanWidget> createState() => _QrscanWidgetState();
}

class _QrscanWidgetState extends State<QrscanWidget> {
  TextEditingController qrcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: SizedBox(
                    width: 250,
                    height: 240,
                    child: MobileScanner(
                        fit: BoxFit.fill,
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          for (final barcode in barcodes) {
                            Navigator.canPop(context)
                                ? Navigator.pop<String>(
                                    context, barcode.rawValue ?? 'No data in QR')
                                : null;
                          }
                        })),
              ),
              
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  controller: qrcode,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter QR Number",
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
              ),
              ButtonWidget(value: "LET'S GO", onpressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
