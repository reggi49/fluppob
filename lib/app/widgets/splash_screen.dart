import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
            child: Container(
          width: Get.width / 2,
          height: Get.height / 2,
          child: Image.asset("assets/icons/logo.png"),
        )),
      ),
    );
  }
}
