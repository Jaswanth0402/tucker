import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tucker/core/utils/colors.dart';


class AboutWidget extends StatefulWidget {

   AboutWidget( {super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: lightgray,
              padding: EdgeInsets.all(22),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CircleAvatar(),
                SizedBox(height: 5,),
               Text("App version : 1.07",style: TextStyle(color: darkYellow),),
               SizedBox(height: 15,),
               Text("Tucker Motors Private Limited is a Leading manufacturer of EV Charging Solution",style: TextStyle(fontSize: 15,color: primaryColor),textAlign: TextAlign.center,)
              ],),
            ),
          ),
          
        ],
      )),
      
    );
  }
}
