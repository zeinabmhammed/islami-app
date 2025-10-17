import 'package:flutter/material.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/quran/chapter_row.dart';
import 'package:islami/ui/sura.dart';

class QuranContent extends StatelessWidget {
  QuranContent({super.key});

  final List<Chapter> chapters = Chapter.getQuranChapters();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: chapters[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 1,
                width: double.infinity,
                color: AppColors.white,
              );
            },
            itemCount: 114,
          ),
        ),
      ],
    );
  }
}
