import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tucker/core/model/registerModel.dart';
import 'package:tucker/core/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<RegisterModel>? futureAlbum;
   void initState() {
    super.initState();
 
     futureAlbum = fetchRegister();
    
  }
  Future<RegisterModel> fetchRegister() async {
  print("123456");
  var response = await http.get(
      Uri.parse(
        'http://cms.tuckerio.bigtot.in/flutter/uDoGetUser.php?idtag=a4505f70b1',
      ),
      headers: {"Content-Type": "application/json"});
   print(response.statusCode);
  if (response.statusCode == 200) {
     print(jsonDecode(response.body));
   return  RegisterModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
    
   
  } else {
    throw Exception('Failed to load Register');
  }
}
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
         child: Scaffold(
          body: SingleChildScrollView(child: FutureBuilder(future: futureAlbum, builder: (context,snapshot){
            if(snapshot.hasData){
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Image(image:AssetImage('assets/images/TUCKER LOGO-1.png'),fit: BoxFit.contain,),
                            ),
                          ),
                          Text(snapshot.data!.message.map((e) => e.name).toString().toUpperCase().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 30,color: primaryColor),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Mobile Number",style: TextStyle(fontSize: 20),),
                            const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.mobile).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                             const SizedBox(height: 12,),
                            const Text("Email",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.email).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("Vechile Number",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.vehicle).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("Address",style: TextStyle(fontSize: 20),),
                            Text(snapshot.data!.message.map((e) => e.address1).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("Address",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.address2).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("Pincode",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.pincode).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("City",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.city).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("State",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.state).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            const Text("Country",style: TextStyle(fontSize: 20),),
                             const SizedBox(height: 5,),
                            Text(snapshot.data!.message.map((e) => e.country).toString().replaceAll(RegExp(r"\p{P}", unicode: true), ""),style: const TextStyle(fontSize: 16),),
                            const SizedBox(height: 12,),
                            ElevatedButton(onPressed: (){}, child: const Text("Edit",style: TextStyle(color: white,fontSize: 18),),style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height*0.06),backgroundColor: primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                            
                          ],
                        ),
                      )
                    ],
                  ),
                );
            }
            else{
              return const SizedBox(height: 10,);
            }
          })),
         ));
  }
}