import 'package:bogorstore/app/constant/colors.dart';
import 'package:bogorstore/app/data/models/juz.dart' as juz;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  DetailJuzView({Key? key}) : super(key: key);
  final juz.Juz detailJuz = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juz ${detailJuz.juz}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: detailJuz.verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (detailJuz.verses == null) {
            return Center(
              child: Text("Tidak ada data"),
            );
          }
          juz.Verses ayat = detailJuz.verses![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: appGrey.withOpacity(0.3)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: Text("${ayat.number?.inQuran}"),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_add_outlined),
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
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
        },
      ),
    );
  }
}
