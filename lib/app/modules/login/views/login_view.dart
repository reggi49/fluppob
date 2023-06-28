import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Image.asset("assets/icons/logo.png"),
        const Text(
          'Silahkan Masuk dengan nomor telkomsel kamu',
          style: TextStyle(fontSize: 20),
        ),
        const Text('Nomor Hp'),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'masukan nomor hape'),
        ),
        CheckboxListTile(
          value: false,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {},
          title: RichText(
              text: const TextSpan(
                  text: "Saya menyetuji ",
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    text: "sddsddsdsas", style: TextStyle(color: Colors.red)),
              ])),
        )
      ]),
    );
  }
}
