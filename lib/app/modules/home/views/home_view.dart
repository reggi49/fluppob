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
    return Scaffold(
      body: FutureBuilder<List<Surah>>(
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
                onTap: () =>
                    {Get.toNamed(Routes.DETAIL_SURAH, arguments: surah)},
                leading: CircleAvatar(
                  child: Text("${surah.number}"),
                ),
                title: Text("${surah.name?.transliteration?.id}"),
                subtitle: Text(
                    "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'error'}"),
                trailing: Text("${surah.name?.short ?? 'Error'}"),
              );
            },
          );
        },
      ),
    );
  }
}
