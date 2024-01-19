import 'package:bogorstore/app/constant/colors.dart';
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
          Text(
            'Al-Quran App',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              // color: appPurple,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Sesibuk itukah kamu sampai belum membaca alquran ?",
              textAlign: TextAlign.center,
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
            style: ElevatedButton.styleFrom(
                backgroundColor: Get.isDarkMode ? appWhite : appPurple),
            child: Text(
              "Mulai ",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Get.isDarkMode ? appPurpleDark : appWhite),
            ),
          )
        ],
      ),
    ));
  }
}
