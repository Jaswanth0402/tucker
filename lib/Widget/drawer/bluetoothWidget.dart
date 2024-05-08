
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:tucker/Widget/component/bleController.dart';

class BluetoothScanner extends StatefulWidget {
  @override
  _BluetoothScannerState createState() => _BluetoothScannerState();
}
class _BluetoothScannerState extends State<BluetoothScanner> {

  @override
  void initState() {
    super.initState();
   BleController controller =BleController();
   controller.scanDevices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<BleController>(
          init: BleController(),
          builder: (BleController controller)
          {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  ElevatedButton(onPressed: ()  async {
                  //   controller.scanDevices();
                  //   // await controller.disconnectDevice();
                  // }, child: Text("SCAN")),
                  SizedBox(height: 10,),
                  StreamBuilder<List<ScanResult>>(
                      stream: controller.scanResults,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final data = snapshot.data![index];
                                  return Card(
                                    elevation: 2,
                                    child: ListTile(
                                      title: Text(data.device.name),
                                      subtitle: Text(data.device.id.id),
                                      trailing: Text(data.rssi.toString()),
                                      onTap: ()=> controller.connectToDevice(data.device),
                                    ),
                                  );
                                }),
                          );
                        }else{
                          return Center(child: Text("No Device Found"),);
                        }
                      }),
                  
                 
                ],
              ),
            );
          },
        )
    );
  }
}