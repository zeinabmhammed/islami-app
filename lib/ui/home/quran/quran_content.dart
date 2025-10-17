import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/quran/chapter_row.dart';
import 'package:islami/ui/sura.dart';

class QuranContent extends StatefulWidget {
  const QuranContent({super.key});

  @override
  State<QuranContent> createState() => _QuranContentState();
}

class _QuranContentState extends State<QuranContent> {
  final List<Chapter> chapters = Chapter.getQuranChapters();
  List<Chapter> filteredChapters = [];

  _QuranContentState() {
    filteredChapters = chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            filterChapters(text.toLowerCase());
          },
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
            fontFamily: "Janna LT",
          ),
          decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
              AppImages.icSearch,
              fit: BoxFit.scaleDown,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            hintText: "Sura Name",
            hintStyle: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0,
              fontFamily: "Janna LT",
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ChapterRow(chapter: filteredChapters[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                height: 1,
                width: double.infinity,
                color: AppColors.white,
              );
            },
            itemCount: filteredChapters.length,
          ),
        ),
      ],
    );
  }

  void filterChapters(String text) {
    List<Chapter> filterList = [];
    for (int i = 0; i < chapters.length; i++) {
      if (chapters[i].englishName.toLowerCase().contains(text) ||
          chapters[i].arabicName.toLowerCase().contains(text)) {
        filterList.add(chapters[i]);
      }
    }
    setState(() {
      filteredChapters = filterList;
    });
  }
}