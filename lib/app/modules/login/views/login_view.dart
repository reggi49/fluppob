import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: "Saya menyetuji ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("syarat");
                          },
                        text: "Syarat, ",
                        style: const TextStyle(color: Colors.red)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("ketentuan");
                          },
                        text: "Ketentuan",
                        style: const TextStyle(color: Colors.blue)),
                    const TextSpan(
                        text: " dan ", style: TextStyle(color: Colors.blue)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("Privasi");
                          },
                        text: "Privasi",
                        style: const TextStyle(color: Colors.red)),
                  ])),
            )
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.black),
          ),
        ),
        const Center(
          child: Text("Atau masuk menggunakan"),
        ),
        Row(
          children: [
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.amber))),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    Text(
                      "Google",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.amber))),
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.facebook),
                    Text(
                      "Facebook",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ))
          ],
        )
      ]),
    );
  }
}
