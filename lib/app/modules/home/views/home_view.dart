import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(text: "Hai, ", children: [
            TextSpan(
                text: "Muhamad",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))
          ])),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                width: 30,
                height: 30,
                child:
                    const FaIcon(FontAwesomeIcons.qrcode, color: Colors.white),
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
                height: 230,
                width: Get.width,
                color: Colors.red,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      ClipPath(
                          clipper: ClipInfoClass(),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            // height: 230,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFE52D27),
                              Color(0xFFB31217),
                            ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Text(
                                    "0121829821",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset("assets/icons/SimPATI_Logo.png")
                                ]),
                                const SizedBox(height: 10),
                                const Text(
                                  "Sisa Pulsa Anda",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Rp 34.000",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.amber),
                                      child: const Text(
                                        "Isi Pulsa",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                RichText(
                                    text: const TextSpan(
                                  text: "Berlaku seumur ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                    TextSpan(
                                        text: "hidup",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16))
                                  ],
                                )),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Telkomsel Point",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        "172",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatusCard(
                              title: "Internet",
                              data: "19.98",
                              satuan: " GB",
                            ),
                            StatusCard(
                              title: "Telepon",
                              data: "19",
                              satuan: " Menit",
                            ),
                            StatusCard(
                              title: "SMS",
                              data: "19",
                              satuan: " SMS",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                  Container(
                    height: 7,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          //body
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            height: 100,
                            color: Colors.amber,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ItemNav(
                                  status: true,
                                  title: "beranda",
                                  icon: "heart",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class ItemNav extends StatelessWidget {
  const ItemNav({
    super.key,
    required this.status,
    required this.title,
    required this.icon,
  });

  final bool status;
  final String title;
  final String icon;

  final Map<String, IconData> iconDataMap = const {
    "house": FontAwesomeIcons.house,
    "heart": FontAwesomeIcons.heart,
    "star": FontAwesomeIcons.star,
    // Add more icon mappings as needed
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          child: FaIcon(
            iconDataMap[icon],
            color: (status == true) ? Colors.red : Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Beranda",
          style: TextStyle(color: (status == true) ? Colors.red : Colors.white),
        ),
      ],
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.data,
    required this.satuan,
  });

  final String title;
  final String data;
  final String satuan;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width * 0.27,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                text: data,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                      text: satuan,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60);

    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 100, size.height);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
