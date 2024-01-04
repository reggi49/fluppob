import 'package:bogorstore/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/introduction_controller.dart';
import 'package:lottie/lottie.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Al-Quran App'),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Sesibuk itukah kamu sampai belum membaca alquran ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
              width: 600,
              height: 300,
              child: Lottie.asset("assets/lotties/animasi-quran.json")),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.home),
              child: Text("Mulai"))
        ],
      ),
    ));
  }
}
