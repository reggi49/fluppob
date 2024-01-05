import 'package:bogorstore/app/data/models/surah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Surah ${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error'}'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error'}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(${surah.name?.translation?.id?.toUpperCase() ?? 'Error'})",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${surah.numberOfVerses ?? 'Error'} Ayat || ${surah.revelation?.id}",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
