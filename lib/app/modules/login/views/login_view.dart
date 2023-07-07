import 'package:bogorstore/app/routes/app_pages.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(children: [
          Container(
              height: 150,
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/icons/logo.png",
                fit: BoxFit.contain,
              )),
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 10),
            child: const Text(
              'Silahkan Masuk dengan nomor telkomsel kamu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text('Nomor HP',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          TextField(
            controller: controller.loginUsername,
            keyboardType: TextInputType.phone,
            autocorrect: false,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'masukan nomor hape'),
          ),
          Row(
            children: [
              Obx(() => Checkbox(
                    activeColor: Colors.red,
                    value: controller.rememberCheck.value,
                    onChanged: (value) => controller.rememberCheck.toggle(),
                  )),
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
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => Get.offAllNamed(Routes.home),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: const Center(
              child: Text("Atau masuk menggunakan"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: Color.fromRGBO(66, 103, 178, 1)),
                      ),
                    ),
                    child: const Row(
                      children: [
                        FaIcon(FontAwesomeIcons.google, color: Colors.red),
                        Text(
                          "Google",
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    )),
                OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(130, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                            color: Color.fromRGBO(66, 103, 178, 1)),
                      ),
                    ),
                    child: const Row(
                      children: [
                        FaIcon(FontAwesomeIcons.facebook),
                        Text(
                          "Facebook",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
