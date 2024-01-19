import 'package:bogorstore/app/constant/colors.dart';
import 'package:bogorstore/app/data/models/juz.dart' as juz;
import 'package:bogorstore/app/data/models/surah.dart';
import 'package:bogorstore/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.SEARCH),
              icon: Icon(Icons.search))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [appPurpleLight1, appPurpleDark])),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                        height: 150,
                        width: Get.width,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: -20,
                                right: 0,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.asset(
                                          "assets/images/banner-1.png")),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.book_online_outlined,
                                        color: appWhite,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Terakhir di",
                                        style: TextStyle(color: appWhite),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Al-Fatihah",
                                    style: TextStyle(color: appWhite),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Jus 1 || Ayat 5",
                                    style: TextStyle(color: appWhite),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TabBar(tabs: [
                Tab(
                  text: "Surah",
                ),
                Tab(
                  text: "Juz",
                ),
                Tab(
                  text: "Bookmark",
                ),
              ]),
              Expanded(
                  child: TabBarView(children: [
                FutureBuilder<List<Surah>>(
                  future: controller.getAllSurah(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("Tidak ada Data"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Surah surah = snapshot.data![index];
                        return ListTile(
                          onTap: () => {
                            Get.toNamed(Routes.DETAIL_SURAH, arguments: surah)
                          },
                          leading: Obx(
                            () => Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(controller.isDark.isTrue
                                      ? "assets/images/list_dark.jpg"
                                      : "assets/images/list_light.jpg"),
                                ), // DecorationImage
                              ), // BoxDecoration
                              child: Center(child: Text("${surah.number}")),
                            ),
                          ), // Container
                          title: Text(
                            "${surah.name?.transliteration?.id}",
                          ),
                          subtitle: Text(
                              "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'error'}"),
                          trailing: Text("${surah.name?.short ?? 'Error'}"),
                        );
                      },
                    );
                  },
                ),
                FutureBuilder<List<juz.Juz>>(
                  future: controller.getAllJuz(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("Tidak ada Data"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        juz.Juz detailJuz = snapshot.data![index];
                        return ListTile(
                          onTap: () => {
                            Get.toNamed(Routes.DETAIL_JUZ, arguments: detailJuz)
                          },
                          leading: Obx(
                            () => Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(controller.isDark.isTrue
                                      ? "assets/images/list_dark.jpg"
                                      : "assets/images/list_light.jpg"),
                                ), // DecorationImage
                              ), // BoxDecoration
                              child: Center(child: Text("${detailJuz.juz}")),
                            ),
                          ), // Container
                          title: Text(
                            "Juz ${detailJuz.juz}",
                          ),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(" Mulai dari ${detailJuz.juzStartInfo}"),
                              Text(" Sampai ${detailJuz.juzEndInfo}"),
                            ],
                          ),
                        );
                      },
                    ); // ListTile
                  },
                ), // FutureBuilder,
                Center(child: Text("Page 3")),
              ]))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.changeThemeMode(),
        child: Obx(
          () => Icon(
            Icons.color_lens,
            color: controller.isDark.isTrue ? appPurpleDark : appWhite,
          ),
        ),
      ),
    );
  }
}
