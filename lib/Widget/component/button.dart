
import 'package:flutter/material.dart';
import 'package:tucker/core/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String? value;
  final VoidCallback? onpressed;
  const ButtonWidget({
  super.key,
  required this.value,
  required this.onpressed
  });
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: onpressed,style: ElevatedButton.styleFrom(minimumSize: Size(MediaQuery.of(context).size.width*0.37,MediaQuery.of(context).size.height*0.06),backgroundColor: primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child:Text(value!,style: const TextStyle(color: white,fontSize: 16),),)
      ],
    );
  }
}