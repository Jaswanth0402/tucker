import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
                  image: AssetImage("assets/images/Designer.png"), fit: BoxFit.fill),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: lightBlueAccent,),
        ),
      ),
    );
  }
}