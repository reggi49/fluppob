import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(text: "Hai", children: [
            TextSpan(
                text: "Mhamad",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
          ])),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                width: 30,
                height: 30,
                child: Image.asset("name", fit: BoxFit.contain),
              ),
            )
          ],
          backgroundColor: Colors.red,
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                height: 250,
                width: Get.width,
                color: Colors.red,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.3,
                    color: Colors.purple,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
