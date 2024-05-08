import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tucker/Widget/component/button.dart';
import 'package:tucker/Widget/component/inputField.dart';
import 'package:tucker/Widget/drawer/mainDashboard.dart';
import 'package:tucker/core/constants/strings.dart';

import '../core/model/registerModel.dart';
import '../core/utils/colors.dart';
import 'package:http/http.dart' as http;


class RegisterWidget extends StatefulWidget {
  String phnumber;
   RegisterWidget({super.key,required this.phnumber});
   

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
    Future<void>? futureAlbum;
   TextEditingController mobile =TextEditingController();
   TextEditingController email =TextEditingController();
   TextEditingController vehicle =TextEditingController();
   TextEditingController address1 =TextEditingController();
   TextEditingController address2 =TextEditingController();
   TextEditingController pincode =TextEditingController();
   TextEditingController city =TextEditingController();
   TextEditingController state =TextEditingController();
   TextEditingController country =TextEditingController();
   RegisterModel? message;
   
  @override
  void initState() {
    super.initState();
   mobile.text ='';
     futureAlbum = fetchRegister();
    
  }
  Future<void> fetchRegister() async {
  print("123456");
  var response = await http.get(
      Uri.parse(
        'http://cms.tuckerio.bigtot.in/flutter/uDoGetUser.php?idtag=a4505f70b1',
      ),
      headers: {"Content-Type": "application/json"});
   print(response.statusCode);
  if (response.statusCode == 200) {
     print(jsonDecode(response.body));
    RegisterModel data =  RegisterModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
      print(data);
    List<Message>message =data.message;
     print(message);
    setState(() {
       mobile.text =message.map((e) => e.mobile).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      vehicle.text =message.map((e) => e.vehicle).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      email.text =message.map((e) => e.email).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      state.text =message.map((e) => e.state).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      city.text =message.map((e) => e.city).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      country.text =message.map((e) => e.country).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      pincode.text =message.map((e) => e.pincode).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      address1.text =message.map((e) => e.address1).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
      address2.text =message.map((e) => e.address2).toString().replaceAll(new RegExp(r"\p{P}", unicode: true), "");
    });
    
    
   
  } else {
    throw Exception('Failed to load Register');
  }
}
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: futureAlbum,

              builder: (context, snapshot){
                if(snapshot.hasData){
                  return
                  Column(
                children: [
                  const SizedBox(height: 10,),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.mobile,
                    controller: mobile,
                    titles: Strings.mobile,
                   
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.email,
                    titles: Strings.email,
                    controller: email,
                    
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.vehicle,
                    titles: Strings.vehicle,
                    controller: vehicle,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.address,
                    titles: Strings.address,
                    controller: address1,
                    
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.address,
                    titles: Strings.address,
                   controller: address2,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.pincode,
                    titles: Strings.pincode,
                    controller: pincode,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.city,
                    titles: Strings.city,
                    controller: city,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.state,
                    titles: Strings.state,
                    controller: state,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.country,
                    titles: Strings.country,
                    controller: country,
                    
                  ),
                  ButtonWidget(value: Strings.register, onpressed: (){})
                ],
              );
                }
                else{
                  return
                  Column(
                children: [
                  const SizedBox(height: 10,),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.mobile,
                    controller: mobile,
                    titles: Strings.mobile,
                    
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.email,
                    titles: Strings.email,
                    controller: email,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.vehicle,
                    titles: Strings.vehicle,
                    controller: vehicle,
                    
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.address,
                    titles: Strings.address,
                    controller: address1,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.address,
                    titles: Strings.address,
                   controller: address2,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.pincode,
                    titles: Strings.pincode,
                    controller: pincode,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.city,
                    titles: Strings.city,
                    controller: city,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.state,
                    titles: Strings.state,
                    controller: state,
                  ),
                   InputWidget(
                    textInputAction: TextInputAction.next,
                    editTextType: Strings.country,
                    titles: Strings.country,
                    controller: country,
                  ),
                  ButtonWidget(value: Strings.register, onpressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainDashboard()));
                  })
                ],
              );
                }
                }
            ),
          ),
        ),
      ),
    );
  }
}
