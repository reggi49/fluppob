import 'package:bogorstore/app/constant/colors.dart';
import 'package:bogorstore/app/data/models/detailSurah.dart' as detail;
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
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          children: [
            GestureDetector(
              onTap: () => Get.defaultDialog(
                title: "Tafsir",
                titleStyle: TextStyle(fontWeight: FontWeight.bold),
                content: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    child: Text(
                      "${surah.tafsir?.id ?? "Tidak ada tafsir pada surah ini"}",
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [appPurpleLight1, appPurpleDark],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error'}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      Text(
                        "(${surah.name?.translation?.id?.toUpperCase() ?? 'Error'})",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: appWhite),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${surah.numberOfVerses ?? 'Error'} Ayat || ${surah.revelation?.id}",
                        style: TextStyle(fontSize: 16, color: appWhite),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<detail.DetailSurah>(
                future: controller.getDetailSurah(surah.number.toString()),
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
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.verses?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (snapshot.data?.verses?.length == 0) {
                          return SizedBox(
                            child: Text("Tidak ada Data"),
                          );
                        }
                        detail.Verse? ayat = snapshot.data?.verses?[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appGrey.withOpacity(0.3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      child: Text("${ayat?.number?.inQuran}"),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon:
                                              Icon(Icons.bookmark_add_outlined),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.play_arrow),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "${ayat?.text?.arab}",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${ayat?.translation?.en}",
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic),
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${ayat?.translation?.id}",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 50),
                          ],
                        );
                      });
                }),
          ],
        ));
  }
}
